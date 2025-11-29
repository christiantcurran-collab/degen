# 🚨 IMPORTANT: Render Web Service Setup (NOT Static Site)

## ⚠️ CRITICAL: This is a Python Flask App - Must be Web Service!

This app **CANNOT** be deployed as a Static Site. It requires:
- Python backend (Flask)
- SQLite database
- Live API calls
- Server-side processing

## ✅ Correct Setup Steps

### Step 1: Delete Existing Static Site (if created)

1. Go to Render Dashboard
2. If you see a "Static Site" service, **DELETE IT**
3. We need to create a **Web Service** instead

### Step 2: Create Web Service (NOT Static Site)

1. Go to https://render.com/dashboard
2. Click **"New +"** button
3. Select **"Web Service"** (NOT "Static Site")
4. Connect your GitHub repository: `christiantcurran-collab/degen`

### Step 3: Configure Web Service

**Settings:**
- **Name:** `premier-league-betting` (or any name)
- **Region:** Choose closest to you
- **Branch:** `main`
- **Root Directory:** (leave empty)
- **Environment:** `Python 3`
- **Build Command:** `chmod +x build.sh && ./build.sh`
- **Start Command:** `gunicorn app:app --bind 0.0.0.0:$PORT --workers 2 --timeout 120`
- **Instance Type:** `Free`

**Environment Variables:**
- `PYTHON_VERSION` = `3.11.0`
- `PYTHONIOENCODING` = `utf-8`
- `ODDS_API_KEY` = `9bc157f3e9720cc01a71655708f5c3ca`

### Step 4: Deploy

Click **"Create Web Service"** and wait for deployment (5-10 minutes)

## 🔍 How to Verify It's a Web Service

After deployment, check:
1. In Render dashboard, it should say **"Web Service"** (not "Static Site")
2. The service should show **"Python"** as the runtime
3. Logs should show: `Starting gunicorn...`
4. Test URL: `https://your-app.onrender.com/ping` → Should return "pong"

## ❌ If You See "Not Found"

If you still see "Not Found":
1. **Check the service type** - Must be "Web Service", not "Static Site"
2. **Check the logs** - Look for Python/gunicorn startup messages
3. **Verify Start Command** - Should be `gunicorn app:app --bind 0.0.0.0:$PORT --workers 2 --timeout 120`
4. **Check Build Logs** - Should show Python installation and pip install

## 📝 Key Differences

| Static Site | Web Service (This App) |
|------------|------------------------|
| No backend | Python Flask backend |
| No database | SQLite database |
| No API calls | Live odds API |
| Just HTML/CSS/JS | Server-side processing |

## 🆘 Still Having Issues?

1. Delete the service in Render
2. Recreate as **Web Service** (not Static Site)
3. Use the exact settings above
4. Check build logs for errors

