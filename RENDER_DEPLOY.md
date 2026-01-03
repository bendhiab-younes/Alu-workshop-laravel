# Deploy to Render.com (Better for PHP)

## Why Render instead of Railway?

- Better PHP 8.3 support
- Easier configuration
- Free tier: 750 hours/month
- Better documentation for Laravel

---

## 🚀 Deploy to Render.com

### Step 1: Go to Render
1. Visit [render.com](https://render.com)
2. Sign up with GitHub
3. Create new **Web Service**
4. Connect your GitHub repo: `Alu-workshop-laravel`

### Step 2: Configure the Service

| Field | Value |
|-------|-------|
| **Name** | `promo-alu-plus` |
| **Root Directory** | Leave empty |
| **Runtime** | PHP |
| **PHP Version** | 8.3 |
| **Build Command** | `composer install --optimize-autoloader` |
| **Start Command** | `php artisan migrate --force && php artisan db:seed --force && php artisan optimize && php -S 0.0.0.0:$PORT -t public` |

### Step 3: Add Environment Variables

Click **Environment** and add:

```env
APP_NAME=Promo Alu Plus
APP_ENV=production
APP_KEY=base64:vdBm64ymRP+a0G/4bKfzq0FtqfNycVUc7CEufDUYq/Y=
APP_DEBUG=false
APP_TIMEZONE=Europe/Paris
APP_URL=https://your-app.onrender.com

DB_CONNECTION=sqlite
DB_DATABASE=/var/data/database.sqlite

LOG_CHANNEL=stderr
CACHE_STORE=file
QUEUE_CONNECTION=sync
SESSION_DRIVER=file
```

### Step 4: Deploy!
- Click **Create Web Service**
- Wait for deployment (2-3 minutes)
- Get your live URL!

---

## 📊 After Deployment

**Your app will be live at:**
- Public: `https://promo-alu-plus.onrender.com`
- Admin: `https://promo-alu-plus.onrender.com/admin`
  - Email: `admin@aluminiumcraft.tn`
  - Password: `password` (change this!)

---

## 💡 If Issues Occur

Check the **Logs** tab in Render dashboard for errors.

Common issues:
- **Database not found**: Render creates `/var/data` directory automatically
- **Permission denied**: Run `chmod -R 775 storage bootstrap/cache`
- **Missing extensions**: PHP 8.3 includes all needed extensions

---

## 🎯 Alternative: Use Composer to Fix Versions

If you want to keep Railway, run locally:

```bash
composer update
```

This downgrades Symfony to work with PHP 8.2. Then:

```bash
git add composer.lock
git commit -m "Update dependencies for PHP 8.2 compatibility"
git push
```

Railway will rebuild automatically.
