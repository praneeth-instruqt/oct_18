# Deploy to Cloud Run

Your container image is stored in Artifact Registry. Now deploy it to **Cloud Run** — Google's serverless container platform that scales from zero to thousands of instances automatically.

## Deploy the Service

Run the following command to deploy your image as a Cloud Run service:

```bash,run
PROJECT_ID=$(gcloud config get-value project)

gcloud run deploy sample-app \
  --image=us-east1-docker.pkg.dev/$PROJECT_ID/web-app/sample-app:v1 \
  --region=us-east1 \
  --platform=managed \
  --allow-unauthenticated
```

This command:
- Creates a Cloud Run service named **sample-app**
- Pulls the image you built in the previous step
- Deploys it to the **us-east1** region
- Allows public (unauthenticated) access

> [!NOTE]
> The `--allow-unauthenticated` flag makes your service publicly accessible. In a production environment, you would typically use IAM or an API gateway to control access.

<instruqt-task id="deploy-cloud-run"></instruqt-task>

## Verify Your Deployment

Once deployed, Cloud Run gives your service a unique HTTPS URL. Retrieve it and test:

```bash,run
URL=$(gcloud run services describe sample-app \
  --region=us-east1 \
  --format='value(status.url)')

echo "Your app is live at: $URL"
```

Now send a request to your app:

```bash,run
curl $URL
```

You should see the HTML response from your Flask application. You can also check the health endpoint:

```bash,run
curl $URL/health
```

You can visit the URL in the **GCP Console** tab — navigate to **Cloud Run** in the left menu to see your service details, logs, and metrics.

<instruqt-button to="tab:gcp-console">View in GCP Console</instruqt-button>

<instruqt-task id="verify-app"></instruqt-task>
