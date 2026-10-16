#!/bin/sh
set -eu

# Copy sample app
cp -r /tmp/app /root/sample-app

# Disable GCE metadata so gcloud does not pick up the node's service account
gcloud config set compute/gce_metadata_read_timeout_sec 0 --quiet 2>/dev/null || true

# Revoke any existing credentials from the node
gcloud auth revoke --all --quiet 2>/dev/null || true

# Authenticate as the lab's student user
gcloud auth login --cred-file=/root/.config/gcloud/credentials.json --quiet 2>/dev/null || true

# Set the project
gcloud config set project "$INSTRUQT_GCP_PROJECT_GCP_PROJECT_PROJECT_ID" --quiet

echo "Environment ready."
