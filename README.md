[![.github/workflows/publish.yml](https://github.com/micheal-ndoh/MK_DOCS/actions/workflows/publish.yml/badge.svg)](https://github.com/micheal-ndoh/MK_DOCS/actions/workflows/publish.yml)

# **My MkDocs Project**

Welcome to the source files repository for my LPIC MkDocs documentation project, utilizing the [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) theme. This project is designed to create clean, responsive, and professional documentation.
Click [here](https://micheal-ndoh.github.io/MK_DOCS) to access the LPIC resource site.
---

## **📚 Project Overview**

- **MkDocs**: A fast and straightforward static site generator tailored for building project documentation.  
- **Material for MkDocs**: A modern theme based on Google's Material Design principles, offering a sleek and intuitive user experience.

---

## **🚀 Live Documentation**

You can view the live version of this documentation at:  
[https://github.com/micheal-ndoh/MK_DOCS](https://github.com/micheal-ndoh/MK_DOCS)

---

## **🛠️ Local Setup**

There are two ways to run the project locally and preview the documentation:

---

### **1. Running with `mkdocs serve`**

#### **Step 1: Clone the Repository**
```bash
git clone https://github.com/micheal-ndoh/MK_DOCS
cd MK_DOCS
```

#### **Step 2: Install MkDocs and Dependencies**
Before installing MkDocs, ensure Python and pip are installed:  
```bash
sudo apt-get update
sudo apt-get install python3-pip
```

If you encounter the **externally-managed-environment** error, create and activate a virtual environment:  
```bash
python3 -m venv myenv
source myenv/bin/activate
```

Install MkDocs and the Material theme:  
```bash
pip install mkdocs
pip install mkdocs-material
```

#### **Step 3: Run the Development Server**
```bash
mkdocs serve
```

Open your browser and navigate to `http://127.0.0.1:8000` to view the documentation locally.

---

### **2. Running with Docker**

#### **Step 1: Pull the Docker Image**
Pull the MkDocs Docker image from GitHub Packages:  
```bash
docker pull ghcr.io/micheal-ndoh/mk_docs:latest
```

#### **Step 2: Run the Docker Container**
```bash
docker run -itd -p 8080:80 ghcr.io/micheal-ndoh/mk_docs
```

#### **Step 3: Access the Documentation**
Open your browser and navigate to `<your-container-ip>:8080` (e.g., `10.38.229.171:8080`).

---

## **📦 Build and Deploy**

#### **Build the Site**
Generate static files for deployment:  
```bash
mkdocs build
```

The output will be stored in the `site/` directory.

#### **Deploy to GitHub Pages**
The project is configured to automatically deploy via GitHub Actions when changes are pushed to the `main` branch.  

To manually deploy:  
```bash
mkdocs gh-deploy
```

---

## **📄 License**

This project is licensed under the **MIT License**. For more details, see the [LICENSE](LICENSE) file.

---
