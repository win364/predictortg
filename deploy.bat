@echo off
echo 🚀 Mines Predictor - Vercel Deployment
echo ========================================
echo.

echo 📁 Проверяем файлы...
if not exist "predictor.html" (
    echo ❌ Ошибка: predictor.html не найден!
    pause
    exit /b 1
)

if not exist "vercel.json" (
    echo ❌ Ошибка: vercel.json не найден!
    pause
    exit /b 1
)

if not exist "package.json" (
    echo ❌ Ошибка: package.json не найден!
    pause
    exit /b 1
)

echo ✅ Все файлы найдены!
echo.

echo 🔧 Устанавливаем Vercel CLI...
call npm install -g vercel
if %errorlevel% neq 0 (
    echo ❌ Ошибка установки Vercel CLI!
    pause
    exit /b 1
)

echo ✅ Vercel CLI установлен!
echo.

echo 🌐 Входим в аккаунт Vercel...
call vercel login
if %errorlevel% neq 0 (
    echo ❌ Ошибка входа в Vercel!
    pause
    exit /b 1
)

echo ✅ Вход выполнен!
echo.

echo 🚀 Запускаем деплой...
call vercel

echo.
echo 🎉 Деплой завершен!
echo 📱 Скопируй полученную ссылку в telegram_bot.py
echo.
pause
