# Setting Up GitHub Pages for the Demo

This document explains how to enable GitHub Pages for the demo deployment.

## Prerequisites

The GitHub Actions workflow (`deploy-demo.yml`) is already set up to build and deploy the demo automatically.

## Enabling GitHub Pages

Follow these steps to enable GitHub Pages for this repository:

1. **Go to Repository Settings**
   - Navigate to your repository on GitHub
   - Click on "Settings" in the top menu

2. **Configure Pages**
   - In the left sidebar, click on "Pages" (under "Code and automation")
   
3. **Set Source**
   - Under "Build and deployment"
   - Set "Source" to **"GitHub Actions"**
   - This allows the workflow to deploy automatically

4. **Save**
   - The configuration is automatically saved

## Automatic Deployment

Once GitHub Pages is enabled:

- Every push to the `main` branch will trigger an automatic build and deployment
- The workflow can also be manually triggered from the "Actions" tab
- The demo will be available at: `https://evaisse.github.io/flutterish_image_cropper/`

## Workflow Overview

The deployment workflow does the following:

1. **Build Job**
   - Checks out the repository
   - Sets up Flutter SDK (version 3.24.5)
   - Installs dependencies for the example app
   - Builds the web version with the correct base href
   - Uploads the build artifacts

2. **Deploy Job**
   - Takes the build artifacts
   - Deploys them to GitHub Pages
   - Provides the deployment URL

## Manual Deployment

To manually trigger a deployment:

1. Go to the "Actions" tab in the repository
2. Select "Deploy Demo to GitHub Pages" workflow
3. Click "Run workflow"
4. Select the `main` branch
5. Click "Run workflow"

## Troubleshooting

If the deployment fails:

1. Check the Actions tab for error logs
2. Ensure GitHub Pages is configured to use GitHub Actions as the source
3. Verify that the repository has the necessary permissions for Pages deployment
4. Make sure the workflow has write permissions for `contents`, `pages`, and `id-token`

## Local Testing

To test the web build locally before deploying:

```bash
cd example
flutter build web --release
cd build/web
python3 -m http.server 8000
```

Then visit `http://localhost:8000` in your browser.
