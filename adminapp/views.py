from django.shortcuts import render,redirect,get_object_or_404
from mainapp.models import UserModel
from adminapp.models import Dataset
from userapp.models import *
import pandas as pd
# from django.shortcuts import render,redirect
from adminapp.models import *
from mainapp.models import *
from userapp.models import *
from django.contrib import messages
#Importing Libraries
import re
import string
import numpy as np
import pandas as pd
import random
import missingno
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.feature_extraction.text import TfidfVectorizer, CountVectorizer
from sklearn.model_selection import train_test_split
from sklearn.pipeline import Pipeline
from sklearn.base import TransformerMixin
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix
from wordcloud import WordCloud
import spacy
from spacy.lang.en.stop_words import STOP_WORDS
from spacy.lang.en import English
from sklearn.svm import SVC
from sklearn.metrics import accuracy_score,f1_score, recall_score, precision_score


# Create your views here.
def admin_dash(request):
    dataset=Dataset.objects.all().count()
    user=UserModel.objects.all().count()
    test=JobModel.objects.all().count()
    return render(request,'admin/admin-dash.html',{'Dataset':dataset,'user':user,'test':test})

def admin_algocomp(request):
    try:
        dt = Dataset.objects.filter(dt_algo='DecisionTreeClassifier').first()
        dt_ac = dt.dt_Accuracy*100
        dt_pr = dt.dt_Precision*100
        dt_re = dt.dt_Recall*100
        dt_fs = dt.dt_F1_Score*100
        lr = Dataset.objects.filter(lr_algo='Logistic Regression').first()
        lr_ac = lr.lr_Accuracy*100
        lr_pr = lr.lr_Precision*100
        lr_re = lr.lr_Recall*100
        lr_fs = lr.lr_F1_Score*100
        nb = Dataset.objects.filter(nb_algo='Naive-Bayes').first()
        nb_ac = nb.nb_Accuracy*100
        nb_pr = nb.nb_Precision*100
        nb_re = nb.nb_Recall*100
        nb_fs = nb.nb_F1_Score*100
        rf = Dataset.objects.filter(rf_algo='RandomForestClassifier').first()
        rf_ac = rf.rf_Accuracy*100
        rf_pr = rf.rf_Precision*100
        rf_re = rf.rf_Recall*100
        rf_fs = rf.rf_F1_Score*100
        context = {
            'lr_ac':lr_ac,
            'lr_pr':lr_pr,
            'lr_re':lr_re,
            'lr_fs':lr_fs,
            'nb_ac':nb_ac,
            'nb_pr':nb_pr,
            'nb_re':nb_re,
            'nb_fs':nb_fs,
            'dt_ac':dt_ac,
            'dt_pr':dt_pr,
            'dt_re':dt_re,
            'dt_fs':dt_fs,
            'rf_ac':rf_ac,
            'rf_pr':rf_pr,
            'rf_re':rf_re,
            'rf_fs':rf_fs,
        
        }
        return render(request,'admin/admin-algocomp.html',context)
    except:
        messages.warning(request,'Run all 4 algorithms to compare values')
        return redirect('admin_view')


def admin_allusers(request):
    user=UserModel.objects.filter(user_status='accepted').order_by('user_id')
    return render(request,'admin/admin-allusers.html',{'user':user})
 

def admin_dectree(request):

    data=Dataset.objects.all().order_by('-data_id').first()
    return render(request,'admin/admin-dectree.html',{'data':data})

def admin_lr(request):
    data = Dataset.objects.all().order_by('-data_id').first()
    print(data,type(data),'dataaaaaaaaaaa')

    return render(request,'admin/admin-lr.html',{'data':data})

def admin_nb(request):
    data = Dataset.objects.all().order_by('-data_id').first()
    return render(request,'admin/admin-nb.html',{'data':data})

def admin_pendingusers(request):
    items = UserModel.objects.filter(user_status='pending').order_by('-user_id')
    return render(request,'admin/admin-pendingusers.html' ,{'items':items})

def admin_randfor(request):
    data = Dataset.objects.all().order_by('-data_id').first()
    return render(request,'admin/admin-randfor.html',{'data':data})

def admin_upload(request):
    if request.method == 'POST':
        dataset = request.FILES['dataset']
        data = Dataset.objects.create(data_set = dataset)
        data = data.data_id
        print(type(data),'type')

        return redirect('admin_view')
    
    return render(request,'admin/admin-upload.html')

def admin_view(request):
    data = Dataset.objects.all().order_by('-data_id').first()
    print(data,type(data),'sssss')
    file = str(data.data_set)
    df = pd.read_csv(f'./media/{file}')
    table = df.to_html(table_id='data_table')


    return render(request,'admin/admin-view.html',{'i':data,'t':table})

def accept_user(request,id):
    accept = get_object_or_404(UserModel,user_id=id)
    accept.user_status = "accepted"
    accept.save(update_fields=["user_status"])
    accept.save()

    return redirect('admin_pendingusers')

def decline_user(request,id):
    decline = get_object_or_404(UserModel,user_id=id)
    decline.user_status = "declined"
    decline.save(update_fields=["user_status"])
    decline.save()

    return redirect('admin_pendingusers')

def RandomForest(request):
    Accuracy = None
    Precision = None
    Recall = None
    F1_Score = None
    data = Dataset.objects.all().order_by('-data_id').first()
    file = str(data.data_set)
    df = pd.read_csv(f'./media/{file}')
    x=df['title']
    y=df['fraudulent']
    print(x.shape,'hhhhhhhhhhhhhhhhhhhhhhhhhh')
    from sklearn.model_selection import train_test_split
    x_train,x_test,y_train,y_test=train_test_split(x,y,test_size=0.3,random_state=0)
    #converting text into Numbers
    from sklearn.feature_extraction.text import TfidfVectorizer
    tf = TfidfVectorizer()
    x_train1 = tf.fit_transform(x_train)
    x_test1 = tf.transform(x_test)
    import joblib
    file=open('job_vc_rf.pkl','wb')
    joblib.dump(tf,file)
    #Mchinelearning
    from sklearn.ensemble import RandomForestClassifier
    model_name = RandomForestClassifier()
    model_name.fit(x_train1,y_train)
    prediction = model_name.predict(x_test1)
    import joblib
    file=open('job_rf.pkl','wb')
    joblib.dump(model_name,file)
    Accuracy=(accuracy_score(prediction,y_test))
    Precision=(precision_score(prediction,y_test,average = 'macro'))
    Recall=(recall_score(prediction,y_test,average = 'macro'))
    F1_Score=(f1_score(prediction,y_test,average = 'macro'))
    print(Accuracy,Precision,Recall,F1_Score,'Scoreeeeeeeeeeeee lr')
    data.rf_Accuracy = Accuracy
    data.rf_Precision = Precision
    data.rf_Recall = Recall
    data.rf_F1_Score = F1_Score
    data.save()  
    data = Dataset.objects.filter(rf_algo='RandomForestClassifier').order_by('-data_id').first()
    return render(request,'admin/admin-randfor.html',{'i':data})

def LogisticRegression(request):
    Accuracy = None
    Precision = None
    Recall = None
    F1_Score = None
    data = Dataset.objects.all().order_by('-data_id').first()
    # id = data.data_id
    file = str(data.data_set)
    df = pd.read_csv(f'./media/{file}')
    x=df['title']
    y=df['fraudulent']
    print(x.shape,'hhhhhhhhhhhhhhhhhhhhhhhhhh')
    from sklearn.model_selection import train_test_split
    x_train,x_test,y_train,y_test=train_test_split(x,y,test_size=0.3,random_state=0)
    #converting text into Numbers
    from sklearn.feature_extraction.text import TfidfVectorizer
    tf = TfidfVectorizer()
    x_train1 = tf.fit_transform(x_train)
    x_test1 = tf.transform(x_test)
    #Mchinelearning
    from sklearn.linear_model import LogisticRegression
    model_name = LogisticRegression()
    model_name.fit(x_train1,y_train)
    prediction = model_name.predict(x_test1)
    Accuracy=(accuracy_score(prediction,y_test))
    Precision=(precision_score(prediction,y_test,average = 'macro'))
    Recall=(recall_score(prediction,y_test,average = 'macro'))
    F1_Score=(f1_score(prediction,y_test,average = 'macro'))
    print(Accuracy,Precision,Recall,F1_Score,'Scoreeeeeeeeeeeee lr')
    data.lr_Accuracy = Accuracy
    data.lr_Precision = Precision
    data.lr_Recall = Recall
    data.lr_F1_Score = F1_Score
    data.save()

    data = Dataset.objects.filter(lr_algo='Logistic Regression').order_by('-data_id').first()

    return render(request,'admin/admin-lr.html',{'data':data})

def navie_bayes(request):
    Accuracy = None
    Precision = None
    Recall = None
    F1_Score = None
    data = Dataset.objects.all().order_by('-data_id').first()
    file = str(data.data_set)
    df = pd.read_csv(f'./media/{file}')
    x=df['title']
    y=df['fraudulent']
    print(x.shape,'hhhhhhhhhhhhhhhhhhhhhhhhhh')
    from sklearn.model_selection import train_test_split
    x_train,x_test,y_train,y_test=train_test_split(x,y,test_size=0.3,random_state=0)
    #converting text into Numbers
    from sklearn.feature_extraction.text import TfidfVectorizer
    tf = TfidfVectorizer()
    x_train1 = tf.fit_transform(x_train)
    x_test1 = tf.transform(x_test)
    #Mchinelearning
    from sklearn.naive_bayes import MultinomialNB
    model_name = MultinomialNB()
    model_name.fit(x_train1,y_train)
    prediction = model_name.predict(x_test1)
    Accuracy=(accuracy_score(prediction,y_test))
    Precision=(precision_score(prediction,y_test,average = 'macro'))
    Recall=(recall_score(prediction,y_test,average = 'macro'))
    F1_Score=(f1_score(prediction,y_test,average = 'macro'))
    print(Accuracy,Precision,Recall,F1_Score,'Scoreeeeeeeeeeeee lr')
    data.nb_Accuracy = Accuracy
    data.nb_Precision = Precision
    data.nb_Recall = Recall
    data.nb_F1_Score = F1_Score
    data.save()

    data = Dataset.objects.filter(nb_algo='Naive-Bayes').order_by('-data_id').first()

    return render(request,'admin/admin-nb.html',{'i':data})
   

def DecisionTree(request):
    Accuracy = None
    Precision = None
    Recall = None
    F1_Score = None
    data = Dataset.objects.all().order_by('-data_id').first()
    file = str(data.data_set)
    df = pd.read_csv(f'./media/{file}')
    x=df['title']
    y=df['fraudulent']
    print(x.shape,'hhhhhhhhhhhhhhhhhhhhhhhhhh')
    from sklearn.model_selection import train_test_split
    x_train,x_test,y_train,y_test=train_test_split(x,y,test_size=0.3,random_state=0)
    print(x_train,'train')
    #converting text into Numbers
    from sklearn.feature_extraction.text import TfidfVectorizer
    tf = TfidfVectorizer()
    x_train1 = tf.fit_transform(x_train)
    x_test1 = tf.transform(x_test)
    #Mchinelearning
    from sklearn.tree import DecisionTreeClassifier
    model_name = DecisionTreeClassifier()
    model_name.fit(x_train1,y_train)
    prediction = model_name.predict(x_test1)
    Accuracy=(accuracy_score(prediction,y_test))
    Precision=(precision_score(prediction,y_test,average = 'macro'))
    Recall=(recall_score(prediction,y_test,average = 'macro'))
    F1_Score=(f1_score(prediction,y_test,average = 'macro'))
    print(Accuracy,Precision,Recall,F1_Score,'Scoreeeeeeeeeeeee lr')
    data.dt_Accuracy = Accuracy
    data.dt_Precision = Precision
    data.dt_Recall = Recall
    data.dt_F1_Score = F1_Score
    data.save()
    data=Dataset.objects.filter(dt_algo='DecisionTreeClassifier').order_by('-data_id').first()
    return render(request,'admin/admin-dectree.html',{'data':data})
   


def button(request,id):
    predict=JobModel.objects.get(pk=id)
    print(predict,'ooooooooooooo')
    X_test=[predict.job_title + predict.job_location + predict.job_dept + predict.job_com_profile + predict.job_description +
             predict.job_requirement + predict.job_benefits + predict.job_req_education + predict.job_req_experience +
             predict.job_industry + predict.job_function]
    print(X_test)
    import joblib
    file=open('job_vc_rf.pkl','rb')
    vc=joblib.load(file)
    X_test1=vc.transform(X_test)
    print(X_test1,'gggggggggggggggggggggggg')
    import joblib
    file=open('job_rf.pkl','rb')
    rfmodel=joblib.load(file)
    from sklearn.svm import SVC
    y_pred=rfmodel.predict(X_test1)
    print(y_pred[0])
    
  

    return redirect('user_result',id=id)


        
    
    




