# DevOps Node.js Service Deployment 🚀

This repository contains Infrastructure as Code (IaC) and automation scripts to provision infrastructure and deploy a Node.js service using **Terraform**, **Ansible**, and **GitHub Actions**.

---

## Requirements

- Knowledge of AWS EC2, VPC and security groups
- Intermediate knowledge of Ansible and github actions

## 📂 Project Structure

--this needs to be worked on--
nodejs-service-deployment
├── .github/
│ └── workflows/
│
├── node_service/
│
├── roles/
│ └── app/
│ └── tasks/
│
├── terraform/
│
├── .gitignore
├── hosts.ini
├── node_service.yaml
└── README.md

---

## ⚙️ Tools & Technologies

- **Terraform** → Infrastructure provisioning (EC2 instance, VPC, Security Group)
- **Ansible** → Configuration management & application deployment
- **GitHub Actions** → CI/CD automation pipeline
- **Node.js** → Application runtime

---

## 🚀 Workflow

1. **Terraform** provisions the infrastructure (e.g., EC2 instance on AWS).
2. **Ansible** connects to the provisioned host and:
   - Installs dependencies (Node.js, npm, package.json)
   - Deploys the Node.js service
   - Ensures the service is running
3. **GitHub Actions** automates:
   - Ansible playbook execution on the designated hosts.
   - Continuous deployment on code changes

---

## 🔑 Setup Instructions

### 1️⃣ Clone the repo

```bash
git clone https://github.com/abirthapa1/nodejs-service-deployment.git
cd nodejs-service-deployment
```

### 2️⃣ Provision Infrastructure with Terraform

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

### 3️⃣ Deploy Application with Ansible (Manually)

Update hosts.ini with your server IP and switch to root folder, then run:

```bash
ansible-playbook -i hosts.ini node_service.yaml --tags app
```

### 4️⃣ CI/CD with GitHub Actions

Note: Make sure you have added the secrets with the correct naming as written in the workflow yaml.

If not then you can check this documentation on how to add one
https://docs.github.com/en/actions/how-tos/write-workflows/choose-what-workflows-do/use-secrets

- Push changes to the main branch.
- The GitHub Actions workflow:
  - Checks out the repo
  - Set's up the SSH for Ansible
  - Installs Ansible
  - Runs the playbook
  - Deploys the Node.js service automatically
