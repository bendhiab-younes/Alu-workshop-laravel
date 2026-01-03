# 🚀 Push to GitHub & Deploy

## Step 1: Create GitHub Repository

1. Go to [github.com/new](https://github.com/new)
2. Repository name: **`promo-alu-plus`** (or any name you prefer)
3. Keep it **Private** (or Public if you want)
4. **DO NOT** initialize with README, .gitignore, or license
5. Click **Create repository**

## Step 2: Push Your Code

Run these commands in your terminal:

```bash
git remote add origin https://github.com/YOUR-USERNAME/promo-alu-plus.git
git branch -M main
git push -u origin main
```

Replace `YOUR-USERNAME` with your GitHub username.

## Step 3: Deploy to Railway

1. Go to [railway.app](https://railway.app)
2. Sign in with GitHub
3. Click **"New Project"**
4. Select **"Deploy from GitHub repo"**
5. Choose **`promo-alu-plus`**
6. Railway will auto-detect Laravel and deploy!

## Step 4: Add Environment Variables in Railway

Go to your project → **Variables** tab → Add these:

```env
APP_NAME=Promo Alu Plus
APP_ENV=production
APP_KEY=base64:vdBm64ymRP+a0G/4bKfzq0FtqfNycVUc7CEufDUYq/Y=
APP_DEBUG=false
APP_URL=https://your-app.up.railway.app
DB_CONNECTION=sqlite
DB_DATABASE=/app/database/database.sqlite
```

**After deployment, update `APP_URL` with your actual Railway URL!**

## Step 5: Access Your Live Site

- **Public Site:** `https://your-app.up.railway.app`
- **Admin Panel:** `https://your-app.up.railway.app/admin`
  - Email: `admin@aluminiumcraft.tn`
  - Password: `password`

---

## 📊 Current Status

✅ Git repository initialized
✅ Initial commit created (170 files)
✅ Ready to push to GitHub
✅ Deployment files configured
✅ Database with demo data included

## 🔧 What Happens on Deployment

Railway will automatically:
1. Install PHP 8.3 + required extensions
2. Run `composer install`
3. Create SQLite database
4. Run migrations & seed demo data
5. Cache routes/config/views
6. Start the server

## 💰 Free Tier Details

**Railway.app:**
- $5/month free credits
- Perfect for demos and small projects
- Auto-deploys on every git push

---

**Need help?** Check [DEPLOYMENT.md](DEPLOYMENT.md) for more options!
