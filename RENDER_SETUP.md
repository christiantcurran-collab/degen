# Render Deployment Setup

## Quick Setup Steps

1. **Create New Web Service** on Render
2. **Connect Repository:** `christiantcurran-collab/degen`
3. **Settings:**
   - **Name:** premier-league-betting (or any name)
   - **Environment:** Python 3
   - **Build Command:** `pip install -r requirements.txt && chmod +x build.sh && ./build.sh`
   - **Start Command:** (Leave empty - will use Procfile)
   - **Health Check Path:** `/ping`

4. **Environment Variables:**
   - `PYTHON_VERSION` = `3.11.0`
   - `PYTHONIOENCODING` = `utf-8`
   - `ODDS_API_KEY` = `9bc157f3e9720cc01a71655708f5c3ca`

5. **Deploy**

## Test Endpoints

After deployment, test these URLs:

- `https://your-app.onrender.com/ping` → Should return "pong"
- `https://your-app.onrender.com/test` → Should return JSON status
- `https://your-app.onrender.com/login` → Should show login page
- `https://your-app.onrender.com/` → Should redirect to login

## Troubleshooting

If you see "Not Found":
1. Check Render logs for startup errors
2. Verify `/ping` endpoint works first
3. Check that Procfile is in root directory
4. Check that `app.py` exists and has Flask app defined


