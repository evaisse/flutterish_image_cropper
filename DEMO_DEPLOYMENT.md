# Demo Deployment Guide

This document provides information about the demo app and its deployment.

## Overview

The demo app is a Flutter web application that showcases all features of the `flutterish_image_cropper` package. It's automatically deployed to GitHub Pages whenever changes are pushed to the `main` branch.

## Live Demo

🌐 **[https://evaisse.github.io/flutterish_image_cropper/](https://evaisse.github.io/flutterish_image_cropper/)**

## Features Showcased

The demo includes:

1. **Image Selection**
   - Load images from your device
   - Use a sample gradient image for testing

2. **Interactive Cropping**
   - Drag corners to resize crop area
   - Pinch to zoom
   - Pan to reposition

3. **Aspect Ratio Presets**
   - Free crop (no constraint)
   - Square (1:1)
   - 4:3 (landscape)
   - 16:9 (widescreen)
   - 3:4 (portrait)
   - 9:16 (vertical/story)
   - 2:1 (wide)

4. **Rotation Controls**
   - Rotate left (counterclockwise)
   - Rotate right (clockwise)

5. **Grid Toggle**
   - Show/hide crop grid overlay

6. **Real-time Preview**
   - See cropped result immediately

## Deployment Process

### Automated Deployment

The deployment is fully automated via GitHub Actions:

1. **Trigger**: Push to `main` branch or manual workflow dispatch
2. **Build**: 
   - Sets up Flutter SDK (v3.24.5)
   - Installs dependencies
   - Builds web app with base href `/flutterish_image_cropper/`
3. **Deploy**: Publishes to GitHub Pages

### Manual Deployment

To manually trigger deployment:

```bash
# From GitHub UI
1. Go to Actions tab
2. Select "Deploy Demo to GitHub Pages"
3. Click "Run workflow"
4. Select branch and run

# Or via gh CLI
gh workflow run deploy-demo.yml
```

## Local Development

### Running the Demo Locally

```bash
cd example
flutter pub get
flutter run -d chrome
```

### Building for Web

```bash
cd example
flutter build web --release
```

The output will be in `example/build/web/`.

### Testing the Build Locally

After building:

```bash
cd example/build/web
python3 -m http.server 8000
```

Visit `http://localhost:8000` in your browser.

## Updating the Demo

To update the demo:

1. Make changes to `example/lib/main.dart`
2. Test locally with `flutter run -d chrome`
3. Commit and push to your branch
4. Create/merge PR to `main`
5. Deployment happens automatically

## Customization

### Changing App Icons

Icons are located in `example/web/icons/`:
- `Icon-192.png` - 192x192 app icon
- `Icon-512.png` - 512x512 app icon
- `Icon-maskable-192.png` - 192x192 maskable icon
- `Icon-maskable-512.png` - 512x512 maskable icon
- `favicon.png` - 32x32 favicon

### Modifying Manifest

Edit `example/web/manifest.json` to change:
- App name and description
- Theme colors
- Display mode
- Orientation

### HTML Template

The main HTML template is in `example/web/index.html`. Modify this to:
- Add meta tags
- Include analytics
- Change page title
- Add custom scripts

## Troubleshooting

### Build Fails

1. Check Flutter SDK version compatibility
2. Ensure all dependencies are up to date
3. Review workflow logs in Actions tab

### Demo Not Updating

1. Check that changes are merged to `main`
2. Verify workflow completed successfully
3. Clear browser cache
4. Wait a few minutes for GitHub Pages to update

### Features Not Working

1. Check browser console for errors
2. Ensure browser supports required features (WebGL, File API)
3. Test in different browsers

## Contributing

To contribute improvements to the demo:

1. Fork the repository
2. Create a feature branch
3. Make your changes to the demo
4. Test thoroughly
5. Submit a pull request

## Resources

- [Flutter Web Documentation](https://docs.flutter.dev/platform-integration/web)
- [GitHub Pages Documentation](https://docs.github.com/pages)
- [GitHub Actions Documentation](https://docs.github.com/actions)
