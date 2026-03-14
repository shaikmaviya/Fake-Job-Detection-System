# Fake Job Detection System

A **Machine Learning based web application** that detects whether a job posting is **Real or Fake**.
The system analyzes job descriptions and predicts the authenticity using trained ML models.

---

## 📌 Project Overview

Fake job postings are increasing on online job portals, leading to scams and misuse of personal information.
This project helps users identify **fraudulent job postings** using **machine learning techniques**.

The system takes job-related information as input and predicts whether the job is **Fake or Genuine**.

---

## 🚀 Features

* Detects **Fake and Real job postings**
* Machine Learning based prediction
* Simple **web interface**
* Supports **multiple trained models**
* File and dataset management
* Admin panel for monitoring

---

## 🛠 Technologies Used

* **Python**
* **Django**
* **Machine Learning**
* **Scikit-learn**
* **Pandas**
* **NumPy**
* **HTML**
* **CSS**
* **JavaScript**
* **SQLite / MySQL**

---

## 📂 Project Structure

```
Fake-Job-Detection-System
│
├── adminapp
├── mainapp
├── userapp
├── assets
│   ├── static
│   └── templates
│
├── dataset
├── media
├── venv
│
├── job_rf.pkl
├── job_svm.pkl
├── job_vc_rf.pkl
├── job_vc_svm.pkl
│
├── manage.py
├── requirements.txt
└── README.md
```

---

## ⚙️ Installation

### 1️⃣ Clone the Repository

```
git clone https://github.com/yourusername/Fake-Job-Detection-System.git
```

### 2️⃣ Navigate to the Project Folder

```
cd Fake-Job-Detection-System
```

### 3️⃣ Create Virtual Environment

```
python -m venv venv
```

### 4️⃣ Activate Virtual Environment

Windows

```
venv\Scripts\activate
```

Mac/Linux

```
source venv/bin/activate
```

### 5️⃣ Install Dependencies

```
pip install -r requirements.txt
```

---

## ▶️ Run the Project

```
python manage.py runserver
```

Open browser and go to:

```
http://127.0.0.1:8000/
```

---

## 🤖 Machine Learning Models Used

* Random Forest
* Support Vector Machine (SVM)
* Voting Classifier

Saved model files:

* `job_rf.pkl`
* `job_svm.pkl`
* `job_vc_rf.pkl`
* `job_vc_svm.pkl`

---

## 📊 Dataset

The dataset contains job postings with labels indicating whether the job is **Fake or Real**.
The model is trained using text processing and classification techniques.

---

## 🎯 Future Improvements

* Improve model accuracy
* Add deep learning models
* Deploy system on cloud
* Real-time job portal integration
* User reporting system

---

## 👨‍💻 Author

**Shaik Maviya**

Final Year Project – Fake Job Detection System

---

## 📄 License

This project is developed for **educational purposes**.
