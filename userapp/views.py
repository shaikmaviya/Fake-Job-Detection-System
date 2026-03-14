from django.shortcuts import render,redirect
from django.contrib import messages
from userapp.models import *
from mainapp.models import *

# Create your views here.
def user_dashboard(request):
    return render(request,'user/user-dashboard.html')


def user_predict(request):
    user_id = request.session['user_id']
    user = UserModel.objects.get(user_id=user_id)

    if request.method == 'POST':
       title = request.POST.get("jobtitle")
       location=request.POST.get("location")
       department=request.POST.get("department")
       salary_range=request.POST.get("salary_range")
       company_profile=request.POST.get("Company_Profile")
       description=request.POST.get("decription")
       requirements=request.POST.get("requirements")
       benefits=request.POST.get("benefits")
       req_experience=request.POST.get("required_experience")
       req_education=request.POST.get("required_education")
       industry=request.POST.get("industry")
       function=request.POST.get("function")
       emp_type=request.POST.get("employment_type")
       print(emp_type,title,location,department,salary_range,company_profile,description,requirements,benefits,req_experience,req_education,industry,function)
       job=JobModel.objects.create(job_title=title,job_location=location,job_dept=department,job_com_profile=company_profile,
                                   job_description=description,job_requirement=requirements,job_benefits=benefits,
                                   job_req_experience=req_experience,job_req_education=req_education,job_industry=industry,
                                   job_function=function,job_salary_range=salary_range,job_emp_type=emp_type,user_url=user)
       
       if job:
            messages.success(request, 'successfully entered jobdata')
            return redirect('user_result',id=job.job_id)

       else:
            messages.error(request, 'Invalid data')
            return redirect('user_predict')
       
       
       
   
    return render(request,'user/user-predict.html')


def user_profile(req):
    user_id = req.session['user_id']
    user = UserModel.objects.get(user_id=user_id)
    if req.method == 'POST':
            username = req.POST.get("user_username")
            email = req.POST.get("user_email")
            contact = req.POST.get("user_contact")
            password = req.POST.get("user_password")
            if len(req.FILES) != 0:
                        image = req.FILES["image"]
                        user.user_username = username
                        user.user_contact = contact
                        user.user_password = password
                        user.user_image = image
                        user.save()
                        messages.success(req,'Updated Successfully')
            else:
                        user.user_username = username
                        
                        user.user_contact = contact
                        user.user_username = username
                        user.user_contact = contact
                        user.user_password = password
                        user.save()
                        messages.success(req,'Updated Successfully')
            
                        
            return redirect('user_profile')
    return render(req,'user/user-profile.html',{'user':user})

def user_result(request,id):
    user_id = request.session['user_id']
    user = UserModel.objects.get(user_id=user_id)
   
    # job = JobModel.objects.get(pk=id)
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
    predict.job_status=y_pred[0]
    predict.save()
    print(predict.job_status,'hhhhhhhhhhhhhhhhhhh')
    # messages.info(request,"non-fraudulent")
    messages.success(request,'Predicted Successfully')

    return render(request,'user/user-result.html',{'job':predict})