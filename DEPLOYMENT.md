# 🚀 Deploy to Railway.app (FREE)

## ✅ Files Already Created:
- ✅ `Procfile` - Tells Railway how to start your app
- ✅ `nixpacks.toml` - PHP 8.3 configuration with required extensions
- ✅ `deploy.sh` - Setup script for migrations and optimization
- ✅ `.env.example` - Production environment template

## 📋 Deployment Steps:

### 1. **Push Your Code to GitHub**
```bash
git add .
git commit -m "Prepare for Railway deployment"
git push origin main
```

### 2. **Deploy to Railway.app**

1. Go to [railway.app](https://railway.app) and sign up with GitHub (FREE)
2. Click **"New Project"**
3. Select **"Deploy from GitHub repo"**
4. Choose your repository: `Alu-workshop`
5. Select root directory: `alu-workshop-laravel`

### 3. **Configure Environment Variables**

In Railway dashboard, go to **Variables** tab and add:

```env
APP_NAME=Promo Alu Plus
APP_ENV=production
APP_KEY=base64:vdBm64ymRP+a0G/4bKfzq0FtqfNycVUc7CEufDUYq/Y=
APP_DEBUG=false
APP_TIMEZONE=Europe/Paris
APP_URL=https://your-app-name.up.railway.app
APP_LOCALE=fr
APP_FALLBACK_LOCALE=fr

DB_CONNECTION=sqlite
DB_DATABASE=/app/database/database.sqlite

SESSION_DRIVER=file
CACHE_STORE=file
QUEUE_CONNECTION=sync

LOG_CHANNEL=stack
LOG_LEVEL=error
```

**Important:** Replace `APP_URL` with your Railway app URL after deployment!

### 4. **Deploy!**
- Railway will automatically:
  - Install PHP 8.3 and extensions
  - Run `composer install`
  - Create SQLite database
  - Run migrations and seeders
  - Start the server

### 5. **Get Your Live URL**
- After deployment, Railway gives you a URL like: `https://your-app.up.railway.app`
- Update the `APP_URL` variable with this URL

---

## 🎯 Alternative FREE Options:

### **Option 2: Render.com (FREE)**
- Free tier with 750 hours/month
- Better for long-running apps
- [render.com](https://render.com)

### **Option 3: Fly.io (FREE)**
- Free tier: 3 VMs with 256MB RAM
- Great performance
- [fly.io](https://fly.io)

---

## 📧 Admin Credentials for Your Client:

**Admin Panel:** `https://your-url/admin`
- **Email:** `admin@aluminiumcraft.tn`
- **Password:** `password`

⚠️ **IMPORTANT:** Change the admin password after first login!

---

## 🔧 Troubleshooting:

**If deployment fails:**
1. Check Railway logs in dashboard
2. Verify all environment variables are set
3. Make sure `APP_KEY` is set (run `php artisan key:generate` locally and copy)

**Database issues:**
- SQLite database is automatically created
- Data is seeded on first deployment

**Need help?** Railway has excellent docs: [docs.railway.app](https://docs.railway.app)
