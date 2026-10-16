# Build the App

Now that your environment is ready, it is time to look at the sample application and package it as a Docker container.

## Explore the Sample App

A simple Python Flask app is already in your home directory. Take a look at its structure:

```bash,run
ls /root/sample-app/
```

The app has three files:

- **app.py** — a Flask web server with a home page and a health endpoint
- **requirements.txt** — Python dependencies (Flask and Gunicorn)
- **Dockerfile** — instructions to build the container image

Have a look at the application code:

```bash,run
cat /root/sample-app/app.py
```

The Dockerfile uses a Python slim image, installs the dependencies, and runs the app with Gunicorn:

```bash,run
cat /root/sample-app/Dockerfile
```

## Create an Artifact Registry Repository

Before you can push an image, you need a Docker repository in Artifact Registry:

```bash,run
gcloud artifacts repositories create web-app \
  --repository-format=docker \
  --location=us-east1 \
  --description="Docker repository for web app"
```

<instruqt-task id="create-repo"></instruqt-task>

## Build and Push the Image

Use **Cloud Build** to build the image and push it to your repository in one step. Cloud Build runs the Docker build on Google's infrastructure — no local Docker daemon needed.

First, configure Docker authentication for your Artifact Registry:

```bash,run
gcloud auth configure-docker us-east1-docker.pkg.dev --quiet
```

Now build and push with Cloud Build:

```bash,run
cd /root/sample-app

PROJECT_ID=$(gcloud config get-value project)

gcloud builds submit \
  --tag us-east1-docker.pkg.dev/$PROJECT_ID/web-app/sample-app:v1
```

> [!IMPORTANT]
> The build takes a minute or two. Watch the output — you will see Docker layers being built and the final image pushed to Artifact Registry.

Once the build completes, verify the image is in your repository:

```bash,run
gcloud artifacts docker images list us-east1-docker.pkg.dev/$PROJECT_ID/web-app
```

<instruqt-task id="build-image"></instruqt-task>
