# DevOps Node.js Service Deployment 🚀

This repository contains Infrastructure as Code (IaC) and automation scripts to provision infrastructure and deploy a Node.js service using **Terraform**, **Ansible**, and **GitHub Actions**.

---

## 📂 Project Structure

.github/workflows/ # GitHub Actions pipeline for automatically running the ansible playbook
node_service/ # Node.js application configuration
roles/app/tasks/ # Ansible tasks for app setup & deployment
terraform/ # Terraform scripts to provision infrastructure
hosts.ini # Ansible inventory (server details)
node_service.yaml # Ansible playbook for Node.js deployment

---

## ⚙️ Tools & Technologies

- **Terraform** → Infrastructure provisioning (e.g., servers, networking)
- **Ansible** → Configuration management & application deployment
- **GitHub Actions** → CI/CD automation pipeline
- **Node.js** → Application runtime

---

## 🚀 Workflow

1. **Terraform** provisions the infrastructure (e.g., EC2 instance on AWS).
2. **Ansible** connects to the provisioned host and:
   - Installs dependencies (Node.js, npm, etc.)
   - Deploys the Node.js service
   - Ensures the service is running
3. **GitHub Actions** automates:
   - Infrastructure setup
   - Ansible playbook execution
   - Continuous deployment on code changes

---

## 🔑 Setup Instructions

### 1️⃣ Clone the repo

```bash
git clone https://github.com/<your-username>/<repo-name>.git
cd <repo-name>
```

### 2️⃣ Provision Infrastructure with Terraform

```bash
cd terraform
terraform init
terraform apply
```

### 3️⃣ Deploy Application with Ansible

Update hosts.ini with your server IP, then run:

```bash
ansible-playbook -i hosts.ini node_service.yaml
```

### 4️⃣ CI/CD with GitHub Actions

- Push changes to the main branch.
- The GitHub Actions workflow:
  - Provisions infrastructure
  - Runs the Ansible playbook
  - Deploys the Node.js service automatically
