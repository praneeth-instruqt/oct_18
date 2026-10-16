# Set Up Your Environment

In this lab you will deploy a Python web application to **Google Cloud Run** — a fully managed platform that automatically scales your containerized apps.

Before building anything, confirm your Google Cloud environment is ready.

## Explore the GCP Console

Click the **GCP Credentials** tab to see your login details, then open the **GCP Console** tab to browse the Google Cloud Console.

<instruqt-button to="tab:gcp-creds">View GCP Credentials</instruqt-button>

## Verify Your Project

The lab has already authenticated the `gcloud` CLI and set your project. Confirm it:

```bash,run
gcloud config get-value project
```

You should see your lab project ID printed. If the project is not set, run:

```bash,run
gcloud config set project $INSTRUQT_GCP_PROJECT_GCP_PROJECT_PROJECT_ID
```

<instruqt-task id="verify-gcloud"></instruqt-task>

## Enable the Required APIs

Your app will use **Artifact Registry** (to store Docker images) and **Cloud Run** (to serve the app). Enable both APIs now:

```bash,run
gcloud services enable artifactregistry.googleapis.com run.googleapis.com
```

> [!NOTE]
> API enablement can take a moment. If you see a permissions error, wait a few seconds and try again — the lab's project needs a moment to fully provision.

<instruqt-task id="enable-apis"></instruqt-task>
