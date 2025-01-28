# My MkDocs Project

This repository contains the source files for my MkDocs documentation project, using the [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) theme.


## 📚 Project Overview

- **MkDocs**: A fast, simple static site generator for building project documentation.
- **Material for MkDocs**: A professional, responsive theme built on Google's Material Design principles.

## 🚀 Live Documentation

You can view the live version of this documentation at:
[https://github.com/micheal-ndoh/MK_DOCS](https://github.com/micheal-ndoh/MK_DOCS)

## 🛠️ Local Setup

There are two ways to run the project locally and preview the documentation:

## Running it using mkdocs serve. 

1. **Clone the repository**:
    ```bash
    git clone https://github.com/micheal-ndoh/MK_DOCS
    cd MK_DOCS
    ```

2. **Install MkDocs and dependencies**:
    ```bash
    pip install mkdocs
    ```

3. **Run the MkDocs development server**:
    ```bash
    mkdocs serve
    ```

    Open your browser and navigate to `http://127.0.0.1:8000` to view the documentation locally.

## 📦 Build and Deploy

- **Build the site**:
    ```bash
    mkdocs build
    ```

    This will generate static files in the `site/` directory.

- **Deploy to GitHub Pages**:
    The project is set up to automatically deploy via GitHub Actions when changes are pushed to the `main` branch.

    To manually deploy:
    ```bash
    mkdocs gh-deploy
    ```
## 🐳 Running a docker container using my mkdocs docker image
 
 1. Pull the image from my git hub packages
```bash
docker pull ghcr.io/micheal-ndoh/mk_docs:latest
```
2.After successfully pulling the image run a docker container with it.
```bash
docker run -itd -p 8080:80 ghcr.io/micheal-ndoh/mk_docs
```
3. Access the contents on your browser using the ip address of your container and the port you assigned when running the container   <your IP>:8080
```
e.g 10.38.229.171:8080
```


## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
