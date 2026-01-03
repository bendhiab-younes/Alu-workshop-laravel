# Deploy to AlwaysData

AlwaysData is perfect for Laravel - native PHP, MySQL, easy to use!

## 📋 Step-by-Step Deployment

### 1. **Create AlwaysData Account**
- Go to [alwaysdata.com](https://www.alwaysdata.com)
- Sign up (they have free plans with good resources)
- Create a new **Web Hosting** account

### 2. **Create Database**

In AlwaysData admin panel:

1. Go to **Databases** → **MySQL**
2. Create new database:
   - **Name**: `alu_plus_db` (or any name)
   - **User**: Create new user with password
   - Remember credentials!

### 3. **Set Up FTP/SSH**

1. Go to **Remote access** section
2. Enable **SSH** (if needed)
3. Get your **FTP credentials** or SSH key

### 4. **Upload Files**

Using FTP (FileZilla, WinSCP, etc.):

1. Connect to AlwaysData FTP
2. Upload files from `alu-workshop-laravel/` to `/www/` directory
3. Create `/www/storage` and `/www/bootstrap/cache` with 755 permissions

### 5. **Configure .env**

Via FTP, edit `.env`:

```env
APP_NAME="Promo Alu Plus"
APP_ENV=production
APP_KEY=base64:vdBm64ymRP+a0G/4bKfzq0FtqfNycVUc7CEufDUYq/Y=
APP_DEBUG=false
APP_TIMEZONE=Europe/Paris
APP_URL=https://your-domain.alwaysdata.net

# MySQL from AlwaysData
DB_CONNECTION=mysql
DB_HOST=mysql-your-username.alwaysdata.net
DB_PORT=3306
DB_DATABASE=your-username_alu_plus_db
DB_USERNAME=your-username_user
DB_PASSWORD=your-database-password

LOG_CHANNEL=stack
LOG_LEVEL=error
CACHE_STORE=file
SESSION_DRIVER=file
QUEUE_CONNECTION=sync
```

### 6. **Install Dependencies**

Via SSH (recommended):

```bash
cd /www
composer install --optimize-autoloader
php artisan key:generate
php artisan config:cache
php artisan route:cache
php artisan view:cache
```

### 7. **Setup Database**

Via SSH:

```bash
php artisan migrate
php artisan db:seed
```

Or via FTP + Web Interface:
- Use phpMyAdmin (usually available in AlwaysData panel)
- Import SQL dump from `database/` folder

### 8. **Fix Permissions**

```bash
chmod -R 775 storage
chmod -R 775 bootstrap/cache
chown -R www-data:www-data .
```

### 9. **Test Your Site**

- **Public Site**: `https://your-domain.alwaysdata.net`
- **Admin Panel**: `https://your-domain.alwaysdata.net/admin`
  - Email: `admin@aluminiumcraft.tn`
  - Password: `password`

---

## 🔐 Important Security Steps

1. **Change admin password** immediately after first login
2. **Update MAIL settings** in AlwaysData for email notifications
3. **Use HTTPS** (AlwaysData provides free SSL)
4. **Backup regularly** (AlwaysData has backup features)

---

## 📧 Configure Email (AlwaysData)

In AlwaysData panel → **Mailboxes**, create an email account:

Then update `.env`:

```env
MAIL_MAILER=smtp
MAIL_HOST=mail.alwaysdata.net
MAIL_PORT=587
MAIL_USERNAME=your-email@your-domain.alwaysdata.net
MAIL_PASSWORD=your-email-password
MAIL_ENCRYPTION=tls
MAIL_FROM_ADDRESS=contact@your-domain.alwaysdata.net
MAIL_FROM_NAME="Promo Alu Plus"
```

---

## 🆘 Troubleshooting

### "Composer not found"
- Contact AlwaysData support to enable Composer
- Or use FTP to upload vendor folder (not ideal)

### "Permission denied on storage"
```bash
chmod -R 777 storage bootstrap/cache
```

### "Database connection error"
- Verify DB credentials in `.env`
- Check MySQL is enabled in AlwaysData
- Test connection via phpMyAdmin first

### "Migrations fail"
- Ensure database user has CREATE TABLE permissions
- Check MySQL version compatibility (8.0+)

---

## 💡 Pro Tips

- Use **WinSCP** for easier FTP/file management
- Keep local backup of `.env` (not in Git!)
- Test locally before pushing changes
- Monitor AlwaysData **Logs** section for errors

---

**Need support?** AlwaysData has excellent French documentation and support!
