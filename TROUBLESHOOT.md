# 🔧 Troubleshooting Guide

## ❌ Build Failures on Render

### Problem: `ERROR: Invalid requirement: 'transformers\nstreamlit-chat'`
**Solution:** ✅ Fixed in new `requirements.txt` - removed incompatible packages

### Problem: Build takes too long or times out
**Solution:**
1. Check `requirements.txt` - remove unnecessary heavy packages
2. Use lightweight versions only:
   ```
   - streamlit (instead of full ML suite)
   - openai (OpenAI API only)
   - pandas (data processing)
   - Remove: torch, transformers, hugchat, huggingface-hub
   ```

### Problem: `curl: command not found` in health check
**Solution:** ✅ Already in Dockerfile - curl installed in slim image

## 🚀 Next Steps After Fix

### Option 1: Retry on Render Dashboard
1. Go to [dashboard.render.com](https://dashboard.render.com)
2. Select your service: **hackgpt**
3. Click **"Manual Deploy"**
4. Select branch: **main**
5. Click **"Deploy latest commit"**

### Option 2: Push New Code (Triggers Auto-Deploy)
```bash
git add .
git commit -m "Fix: Render deployment issues"
git push origin main
```

## ✅ Verification Checklist

- [ ] Build completes without errors (check Render logs)
- [ ] Service shows "Live" status
- [ ] You can access: `https://hackgpt.onrender.com`
- [ ] Streamlit loads in browser
- [ ] API key input field appears

## 📊 Build Time Estimates

- **Old (broken):** ❌ 15-20 min + errors
- **New (fixed):** ✅ 3-5 minutes

## 🆘 Still Not Working?

### Check these in order:

1. **Environment Variables Set?**
   ```
   OPENAI_API_KEY = sk-xxx... (required)
   JIRA_SERVER = (optional)
   ```

2. **Dockerfile Building?**
   ```bash
   # Test locally
   docker build -t hackgpt .
   docker run -e OPENAI_API_KEY=sk-xxx -p 8501:8501 hackgpt
   ```

3. **requirements.txt Valid?**
   ```bash
   # Test locally
   pip install -r requirements.txt
   ```

4. **Check Render Logs:**
   - Click service name
   - Scroll to "Logs" section
   - Look for red error messages

## 📝 Changes Made

✅ **requirements.txt** - Removed heavy ML packages
✅ **Dockerfile** - Simplified for faster builds
✅ **render.yaml** - Cleaned up configuration
✅ **requirements-prod.txt** - Lightweight alternative

## 💡 Pro Tips

1. **Use Render CLI for local testing:**
   ```bash
   render build
   ```

2. **Monitor builds in real-time:**
   - SSH into Render: `render exec bash`

3. **Check disk space:**
   - Free tier has 1GB limit
   - Don't store large files in `/app`

4. **Enable auto-redeploy:**
   - Settings → Auto-deploy → Enable
   - Redeploys on every GitHub push

## 🔗 Useful Links

- [Render Docs](https://render.com/docs)
- [Docker Docs](https://docs.docker.com)
- [Streamlit Docs](https://docs.streamlit.io)
- [OpenAI API](https://platform.openai.com/docs)

---

**Need Help?** Check Render dashboard logs for detailed error messages! 📋
