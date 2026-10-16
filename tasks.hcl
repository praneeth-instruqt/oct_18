resource "task" "verify-gcloud" {
  description     = "Verify that the Google Cloud CLI is configured with your lab project"
  success_message = "Your Google Cloud environment is ready to go!"

  condition "project-configured" {
    description = "The gcloud CLI is configured with the lab project"

    check {
      failure_message = "Your gcloud project is not set. Run the command shown in the instructions above."
      script          = "scripts/task/verify-gcloud/project-configured_check0"
    }

    solve {
      script = "scripts/task/verify-gcloud/project-configured_solve0"
    }
  }

  config {
    target  = resource.container.shell
    timeout = "30s"
  }
}

resource "task" "enable-apis" {
  description     = "Enable the Artifact Registry and Cloud Run APIs in your project"
  success_message = "APIs are enabled and ready!"

  condition "apis-enabled" {
    description = "Artifact Registry and Cloud Run APIs are enabled"

    check {
      failure_message = "One or both APIs are not enabled. Use gcloud services enable to turn on artifactregistry.googleapis.com and run.googleapis.com."
      script          = "scripts/task/enable-apis/apis-enabled_check0"
    }

    solve {
      script = "scripts/task/enable-apis/apis-enabled_solve0"
    }
  }

  config {
    target  = resource.container.shell
    timeout = "60s"
  }
}

resource "task" "create-repo" {
  description     = "Create a Docker repository in Artifact Registry to store your container image"
  success_message = "Your Artifact Registry repository is ready!"

  condition "repo-exists" {
    description = "A Docker repository named 'web-app' exists in Artifact Registry"

    check {
      failure_message = "The Artifact Registry repository 'web-app' was not found in us-east1. Did you create it with the correct name and location?"
      script          = "scripts/task/create-repo/repo-exists_check0"
    }

    solve {
      script = "scripts/task/create-repo/repo-exists_solve0"
    }
  }

  config {
    target  = resource.container.shell
    timeout = "60s"
  }
}

resource "task" "build-image" {
  description     = "Build the Docker image and push it to Artifact Registry"
  success_message = "Image built and pushed to Artifact Registry!"

  condition "image-pushed" {
    description = "The container image exists in the Artifact Registry repository"

    check {
      failure_message = "No container image found in the web-app repository. Have you built and pushed your image to us-east1-docker.pkg.dev/$PROJECT/web-app?"
      script          = "scripts/task/build-image/image-pushed_check0"
    }

    solve {
      script = "scripts/task/build-image/image-pushed_solve0"
    }
  }

  config {
    target  = resource.container.shell
    timeout = "300s"
  }
}

resource "task" "deploy-cloud-run" {
  description     = "Deploy the container image to Cloud Run"
  success_message = "Your app is live on Cloud Run!"

  condition "service-deployed" {
    description = "A Cloud Run service named 'sample-app' is deployed and serving"

    check {
      failure_message = "The Cloud Run service 'sample-app' was not found in us-east1. Have you deployed it with the correct name and region?"
      script          = "scripts/task/deploy-cloud-run/service-deployed_check0"
    }

    solve {
      script = "scripts/task/deploy-cloud-run/service-deployed_solve0"
    }
  }

  config {
    target  = resource.container.shell
    timeout = "300s"
  }
}

resource "task" "verify-app" {
  description     = "Verify the deployed application is responding"
  success_message = "Your web app is live and responding on Cloud Run!"

  condition "app-responds" {
    description = "The Cloud Run service returns a successful HTTP response"

    check {
      failure_message = "The app is not returning a 200 response. Check that your Cloud Run service is deployed and accessible. Try: curl $(gcloud run services describe sample-app --region=us-east1 --format='value(status.url)')"
      script          = "scripts/task/verify-app/app-responds_check0"
    }

    solve {
      script = "scripts/task/verify-app/app-responds_solve0"
    }
  }

  config {
    target  = resource.container.shell
    timeout = "60s"
  }
}
