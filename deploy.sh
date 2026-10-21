#!/usr/bin/env bash
set -e
# 一鍵建立 exam-web 公開儲存庫、推送 main 分支並啟用 GitHub Pages
if command -v gh >/dev/null 2>&1; then
  gh repo create exam-web --public --source=. --remote=origin --push
  OWNER=$(gh api user -q .login)
  gh api -X POST "repos/${OWNER}/exam-web/pages" -f "source[branch]=main" -f "source[path]=/" || true
  echo "✅ 已發布至：https://${OWNER}.github.io/exam-web/"
else
  echo "請先設定您的 GitHub 遠端網址："
  echo "  git remote add origin https://github.com/<您的GitHub帳號>/exam-web.git"
  echo "  git push -u origin main"
fi
