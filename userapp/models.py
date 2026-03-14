from django.db import models
from mainapp.models import *

# Create your models here.
class JobModel(models.Model):
    
    job_id = models.AutoField(primary_key=True)
    user_url = models.ForeignKey(UserModel,null=True, on_delete=models.CASCADE,related_name='user_url')
    job_title = models.TextField()
    job_location=models.TextField()
    job_dept=models.TextField()
    job_com_profile=models.TextField()
    job_description=models.TextField()
    job_requirement=models.TextField()
    job_benefits=models.TextField()
    job_req_experience=models.TextField()
    job_req_education=models.TextField()
    job_industry=models.TextField()
    job_function=models.TextField()
    job_salary_range=models.TextField()
    job_emp_type=models.TextField()
    job_status=models.CharField(max_length=50,null=True,blank=True)
    class Meta:
        db_table = 'job_Details'

class PredictModel(models.Model):
    
    job_id = models.AutoField(primary_key=True)
    user_id = models.ForeignKey(UserModel,null=True, on_delete=models.CASCADE,related_name='user_url_id')
    job_title = models.CharField(max_length=100)
    job_location=models.CharField(max_length=100)
    job_dept=models.CharField(max_length=100)
    job_com_profile=models.CharField(max_length=100)
    job_description=models.CharField(max_length=100)
    job_requirement=models.CharField(max_length=100)
    job_benefits=models.CharField(max_length=100)
    job_req_experience=models.CharField(max_length=100)
    job_req_education=models.CharField(max_length=100)
    job_industry=models.CharField(max_length=100)
    job_function=models.CharField(max_length=100)
    job_salary_range=models.CharField(max_length=100)
    job_emp_type=models.CharField(max_length=100)

    class Meta:
        db_table = 'predict_Details'
