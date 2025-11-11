# Quick Start Guide - Demo Deployment

This guide will help you get the demo running in 5 minutes! ⚡

## 🎯 What You Get

A live, interactive demo of the flutterish_image_cropper library hosted on GitHub Pages at:
**https://evaisse.github.io/flutterish_image_cropper/**

## ⚙️ One-Time Setup (After Merging PR)

1. **Enable GitHub Pages**
   ```
   Repository → Settings → Pages → Source: "GitHub Actions"
   ```
   That's it! ✅

2. **Wait for Deployment**
   - The workflow runs automatically on merge to main
   - Check progress in the "Actions" tab
   - Takes ~2-3 minutes

3. **Visit Your Demo**
   - Go to: https://evaisse.github.io/flutterish_image_cropper/
   - Share with the world! 🌍

## 🔄 Updating the Demo

Every time you push to main, the demo updates automatically! No manual steps needed.

```bash
# Edit the demo
vim example/lib/main.dart

# Commit and push
git add .
git commit -m "Improve demo UI"
git push

# 🎉 Demo auto-updates in 2-3 minutes!
```

## 🧪 Testing Locally

```bash
cd example
flutter run -d chrome
```

## 📦 What's Included

### Files Created
- ✅ `example/web/` - All web assets (HTML, manifest, icons)
- ✅ `.github/workflows/deploy-demo.yml` - Auto-deployment
- ✅ Enhanced `example/lib/main.dart` - Feature-rich demo
- ✅ Documentation files (README, guides)

### Features Showcased
- ✅ Image loading (picker + sample)
- ✅ Interactive cropping
- ✅ 7 aspect ratio presets
- ✅ Rotation controls
- ✅ Grid toggle
- ✅ Real-time preview

## 🐛 Troubleshooting

**Demo not appearing?**
- Check Actions tab for build status
- Verify Pages source is "GitHub Actions"
- Clear browser cache

**Build failing?**
- Check workflow logs in Actions tab
- Ensure Flutter version compatibility
- Verify all dependencies are declared

## 📚 More Info

- Detailed deployment guide: `DEMO_DEPLOYMENT.md`
- GitHub Pages setup: `GITHUB_PAGES_SETUP.md`
- Implementation details: `IMPLEMENTATION_SUMMARY.md`

## 🎨 Customization

**Change icons:** Replace files in `example/web/icons/`
**Modify manifest:** Edit `example/web/manifest.json`
**Update HTML:** Edit `example/web/index.html`
**Enhance demo:** Edit `example/lib/main.dart`

## ✨ That's It!

Your demo is now:
- 🚀 Automatically deployed
- 🌐 Publicly accessible
- 📱 Mobile-friendly
- 💾 PWA-ready
- ⚡ Super fast

Enjoy! 🎉
