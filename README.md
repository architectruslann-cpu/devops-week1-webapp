# DevOps Week 1 Web App

This is my first DevOps portfolio project.

The goal of this project is to learn the basic DevOps workflow by deploying a simple HTML web application with Docker, AWS EC2, and Terraform.

---

## Project Overview

This project contains a simple static web page.

The application was first tested locally with Docker.  
Then it was deployed to an AWS EC2 Linux server.  
After that, the EC2 infrastructure was also created with Terraform.

---

## Technologies Used

- HTML
- Git and GitHub
- Docker
- Nginx
- AWS EC2
- Security Groups
- SSH
- Terraform

---

## Project Structure

```text
devops-week1-webapp
├── app
│   └── index.html
├── docker
├── notes
│   ├── day-1.txt
│   ├── day-2.txt
│   ├── day-3.txt
│   ├── day-4.txt
│   ├── day-5.txt
│   ├── day-6.txt
│   └── final-summary.txt
├── terraform
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── Dockerfile
└── README.md
```

---

## What the App Does

The app displays a simple web page with this message:

```text
Hello, I am Ruslan.
This is my first DevOps project.
I am learning GitHub, Docker, and DevOps step by step.
```

---

## Docker Part

The app uses an Nginx-based Docker image.

The `Dockerfile` copies the HTML file into the default Nginx web directory.

```dockerfile
FROM nginx:alpine

COPY app/index.html /usr/share/nginx/html/index.html

EXPOSE 80
```

The container was tested locally with port mapping:

```bash
docker run -d --name devops-week1-webapp-container -p 8080:80 devops-week1-webapp:day2
```

This means:

```text
localhost:8080 → container:80 → Nginx → index.html
```

---

## AWS EC2 Deployment

The application was deployed to an AWS EC2 Ubuntu server.

Main EC2 settings used during the lab:

```text
Region: eu-central-1 / Frankfurt
Instance type: t4g.nano
Port 22: SSH access
Port 8080: Web application access
```

The app was tested in the browser with:

```text
http://EC2_PUBLIC_IP:8080
```

---

## Security Group

The Security Group worked like a firewall for the EC2 instance.

Inbound rules used:

```text
22    → SSH
8080  → Web app access
```

For better security, the ports were opened only to my own public IP address.

---

## Terraform Part

Terraform was used to create the EC2 infrastructure with code.

Terraform files:

```text
main.tf       → defines AWS resources
variables.tf → defines values like region, instance type, key name, and IP
outputs.tf   → shows useful output values like public IP and web app URL
```

Terraform created:

```text
1. EC2 instance
2. Security Group
```

Important Terraform commands used:

```bash
terraform init
terraform fmt
terraform validate
terraform plan -out=tfplan
terraform apply "tfplan"
terraform destroy
```

---

## Troubleshooting Practice

I practiced two basic troubleshooting scenarios.

### 1. Stopped Container

Problem:

```text
The web app did not open because the Docker container was stopped.
```

Checks used:

```bash
docker ps
docker ps -a
docker start devops-week1-webapp-container
```

### 2. Wrong Port

Problem:

```text
The app was running on port 8080, but I tested port 8081.
```

Lesson:

```text
If the app does not open, check the correct port, container status, and Security Group rules.
```

---

## What I Learned

In this project, I learned:

- How to create a basic project structure
- How to use Git and GitHub
- How to write a simple Dockerfile
- How to build and run a Docker container
- How to deploy a Docker app on AWS EC2
- How to configure Security Group ports
- How to use SSH to connect to a Linux server
- How to describe AWS infrastructure with Terraform
- How to destroy Terraform-created resources to avoid extra cost

---

## Important Note

This project is for learning and portfolio practice.

AWS resources were deleted after testing to avoid extra cost.