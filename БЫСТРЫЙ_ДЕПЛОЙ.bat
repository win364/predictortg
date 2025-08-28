@echo off
echo ==================================================
echo 🚀 БЫСТРЫЙ ДЕПЛОЙ MINES PREDICTOR НА VERCEL
echo ==================================================
echo.

echo 📦 Установка Vercel CLI...
npm install -g vercel

echo.
echo 🔐 Вход в Vercel...
vercel login

echo.
echo 🚀 Деплой проекта...
vercel --prod

echo.
echo ✅ Деплой завершен!
echo 🌐 Ваш сайт доступен по ссылке выше
echo.
pause
