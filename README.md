# 🚀 Static Website CI/CD Deployment using Terraform & Jenkins

This project demonstrates an **end-to-end CI/CD pipeline** to deploy a **static website on AWS EC2** using **Terraform for infrastructure provisioning** and **Jenkins for automated deployment**.

---

## 🛠 Tools & Technologies

- AWS EC2
- Terraform
- Jenkins (Declarative Pipeline)
- Nginx
- Git & GitHub
- Linux (Ubuntu / Amazon Linux)

---

## 🏗 Architecture Diagram

![](/image/jenkins_terraform_10.png)

```
Developer
|
| Git Push
v
GitHub Repository
|
| Jenkins Trigger
v
Jenkins CI/CD Pipeline
|
| SSH / SCP
v
AWS EC2 Instance
(Nginx Web Server)
|
v
End Users (Browser)

```


---

## ⚙️ Project Workflow

1. Developer pushes static website code to GitHub repository
2. Jenkins pipeline triggers automatically
3. Jenkins performs the following steps:
   - Checkout source code
   - Connects to EC2 using SSH
   - Installs and configures Nginx
   - Uploads static website files
   - Deploys files to /var/www/html
   - Restarts Nginx service
   - Performs smoke testing using curl
4. Website becomes live on EC2 public IP

---

## 📂 Project Structure
```
├── Jenkinsfile
├── main.tf
├── user_data.sh
├── index.html
├── assets/
│ ├── css/
│ └── images/
├── screenshots/
└── README.md

```

---

## 🧾 Jenkins Pipeline Stages

- Checkout Source Code
- Prepare Remote Server
- Upload & Deploy Website
- Smoke Test
- Post Build Actions

---

## ☁️ Terraform Resources Used

- AWS Provider (ap-south-1)
- EC2 Instance (t2.micro)
- Security Group
  - Port 22 (SSH)
  - Port 80 (HTTP)
  - Port 8080
- AWS Key Pair
- User Data Script

---

## 🖼 Screenshots

Add screenshots inside the screenshots directory.

- Terraform Apply Output:
![](/image/Screenshot%20(79).png)

- Jenkins Pipeline Success: 
![](/image/Screenshot%20(74).png)

- Jenkins Code File:
![](/image/Screenshot%20(80).png)  

- Website Running in Browser:  
![](/image/Screenshot%20(81).png)

Example:
```
screenshots/jenkins-pipeline-success.png
screenshots/website-live.png

```

---

## 🌐 Live Website

```
http://<EC2-PUBLIC-IP>

```

---

## ✅ Key Features

- Fully automated CI/CD pipeline
- Infrastructure as Code using Terraform
- Jenkins Pipeline as Code
- Secure SSH-based deployment
- Production-ready Nginx setup
- Zero manual intervention

---

## 🧠 Learning Outcomes

- Hands-on CI/CD pipeline implementation
- Jenkins automation with pipelines
- Terraform AWS infrastructure provisioning
- DevOps best practices

---

## 📌 Conclusion

This project showcases a real-world DevOps CI/CD implementation where Terraform provisions AWS infrastructure and Jenkins automates static website deployment, resulting in a reliable and scalable web hosting solution.

---

## 👤 Author

Vaibhav Bhuse  
DevOps Enthusiast | AWS | Terraform | Jenkins | CI/CD
