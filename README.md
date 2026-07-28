# Abena — Koda Journey (GitHub Pages)

Static personal site. Deploy **this entire folder** to your GitHub Pages repo (e.g. `afeeer.github.io`).

## Required structure

```
index.html
style.css
script.js
images/showroom/01-onboarding-who.png
images/showroom/02-main-domain.png
... (all 13 PNGs)
```

The App Showroom breaks if `images/showroom/` is missing from the repo. Uploading PNGs to the repo root or to a different repo will not work — paths in `index.html` are `images/showroom/<filename>.png`.

## Deploy (GitHub web UI)

1. Open your Pages repo on GitHub.
2. Click **Add file → Upload files**.
3. Drag the whole **`images`** folder (not individual PNGs at the root).
4. Confirm paths look like `images/showroom/08-learning-path.png`.
5. Commit to `main`.

## Deploy (git)

```bash
cd Kodadev
git init
git add index.html style.css script.js images .nojekyll
git commit -m "Add showroom images for GitHub Pages"
git remote add origin https://github.com/afeeer/afeeer.github.io.git
git branch -M main
git push -u origin main
```

Replace the remote URL with your actual Pages repo if different.
