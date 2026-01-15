# 🚀 Render par Deploy Karne ke liye Guide

## Prerequisites
- GitHub account (✅ Aapka code already GitHub par hai)
- Render.com account (free)
- OpenAI API Key
- JIRA credentials (optional)

---

## Step 1: Render par Account Banao

1. **[render.com](https://render.com)** par jaao
2. **"Sign up"** button click karo
3. GitHub se login karo
4. Authorization dedo

---

## Step 2: New Web Service Create Karo

1. Render dashboard par jaao
2. **"+ New +"** button click karo
3. **"Web Service"** select karo
4. **GitHub repository connect karo:**
   - **Repository:** `Stiphan680/hackGPT`
   - **Branch:** `main`
   - **Connect** button click karo

---

## Step 3: Deployment Configuration Set Karo

### Name aur Settings:
```
Name:              hackgpt
Environment:       Docker
Region:            Singapore (Asia closest)
Plan:              Free ($0/month) ya Starter ($7/month)
Auto-deploy:       Enable
```

### Build aur Start Commands (already .yaml mein set hai):
```bash
Build Command:    pip install --no-cache-dir -r requirements.txt && mkdir -p personas output
Start Command:    streamlit run hackGPTv23.py --server.port 8501 --server.address 0.0.0.0
```

---

## Step 4: Environment Variables Set Karo

Render dashboard mein **"Environment"** tab jaao aur ye variables add karo:

### Required:
```
OPENAI_API_KEY = sk-your-actual-key-here
STREAMLIT_SERVER_HEADLESS = true
STREAMLIT_SERVER_PORT = 8501
```

### Optional (JIRA ke liye):
```
JIRA_SERVER = https://your-jira.atlassian.net
JIRA_USER = your_email@example.com
JIRA_TOKEN = your_jira_api_token
```

---

## Step 5: Deploy Karo

1. **"Deploy"** button click karo
2. Build start hoga (2-5 minutes ka time le sakta hai)
3. Logs mein monitor karo progress
4. Deployment complete hone ke baad URL milega:

```
✅ Your app is live at:
https://hackgpt.onrender.com
```

---

## Step 6: Verification

✅ **Deployment successful check karo:**

```bash
curl https://hackgpt.onrender.com
```

Ya apne browser mein kholo aur Streamlit interface dekho.

---

## 🔄 Auto-Restart Settings

Render mein **"Settings"** tab jaao:

1. **"Auto-deploy"** → Enable (GitHub push ke baad auto deploy)
2. **"Health Check"** → Enable (`/_stcore/health`)
3. **"Instance restart"** → Daily (optional, free plan ke liye recommended)

---

## 📊 Monitoring aur Logs

```bash
# Live logs dekho:
https://dashboard.render.com/web/YOUR_SERVICE_ID/logs
```

---

## 🚨 Common Issues aur Solutions

### ❌ Issue 1: "Port 8501 not accessible"
**Solution:** Dockerfile mein ye add karke dekho:
```dockerfile
EXPOSE 8501
HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health || exit 1
```

### ❌ Issue 2: "OPENAI_API_KEY not found"
**Solution:** 
- Environment variables properly set hain check karo
- Quote marks remove karo from key
- .env.example check karo format

### ❌ Issue 3: "Build timeout"
**Solution:**
- Starter plan use karo (build time zyada milega)
- Dependencies lightweight rakho
- Layer caching optimize karo

### ❌ Issue 4: "Memory exceeded (Free plan limit)"
**Solution:**
- Starter plan upgrade karo ($7/month)
- Ya localhost pe run karo

---

## 🎯 Deployment After GitHub Push

1. **Local changes karo** (example: `hackGPTv23.py`)
2. **Git mein push karo:**
   ```bash
   git add .
   git commit -m "Update: Add new feature"
   git push origin main
   ```
3. **Render automatically deploy karega** ✨
4. 2-5 minutes mein live hoga

---

## 📱 Production URL

```
🌐 Live URL: https://hackgpt.onrender.com
📊 Dashboard: https://dashboard.render.com
🔄 Auto-deploy: Every GitHub push
💾 Storage: Free (1GB persistent disk)
🔒 SSL/TLS: Automatic ✅
```

---

## 💡 Pro Tips

1. **Custom domain:** Render settings mein custom domain add kar sakte ho
2. **GitHub integration:** Automatic redeploy on push
3. **Environment secrets:** Render.com par hi set karo, GitHub par nahi
4. **Backup:** Render persistent disk feature use karo
5. **Analytics:** Render dashboard se traffic monitor karo

---

## 🆘 Support

- **Render Docs:** https://render.com/docs
- **Streamlit Docs:** https://docs.streamlit.io
- **OpenAI API:** https://platform.openai.com/docs

---

**🎉 Congratulations!** Aapka hackGPT live hai! 🚀
