# 🚀 Mines Predictor - Vercel Deployment (PowerShell)
# ===================================================

Write-Host "🚀 Mines Predictor - Vercel Deployment" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Проверяем файлы
Write-Host "📁 Проверяем файлы..." -ForegroundColor Yellow
$requiredFiles = @("predictor.html", "vercel.json", "package.json")

foreach ($file in $requiredFiles) {
    if (-not (Test-Path $file)) {
        Write-Host "❌ Ошибка: $file не найден!" -ForegroundColor Red
        Read-Host "Нажми Enter для выхода"
        exit 1
    }
}

Write-Host "✅ Все файлы найдены!" -ForegroundColor Green
Write-Host ""

# Устанавливаем Vercel CLI
Write-Host "🔧 Устанавливаем Vercel CLI..." -ForegroundColor Yellow
try {
    npm install -g vercel
    if ($LASTEXITCODE -ne 0) {
        throw "Ошибка установки Vercel CLI"
    }
    Write-Host "✅ Vercel CLI установлен!" -ForegroundColor Green
} catch {
    Write-Host "❌ Ошибка установки Vercel CLI: $_" -ForegroundColor Red
    Read-Host "Нажми Enter для выхода"
    exit 1
}

Write-Host ""

# Входим в аккаунт Vercel
Write-Host "🌐 Входим в аккаунт Vercel..." -ForegroundColor Yellow
try {
    vercel login
    if ($LASTEXITCODE -ne 0) {
        throw "Ошибка входа в Vercel"
    }
    Write-Host "✅ Вход выполнен!" -ForegroundColor Green
} catch {
    Write-Host "❌ Ошибка входа в Vercel: $_" -ForegroundColor Red
    Read-Host "Нажми Enter для выхода"
    exit 1
}

Write-Host ""

# Запускаем деплой
Write-Host "🚀 Запускаем деплой..." -ForegroundColor Yellow
try {
    vercel
    Write-Host ""
    Write-Host "🎉 Деплой завершен!" -ForegroundColor Green
    Write-Host "📱 Скопируй полученную ссылку в telegram_bot.py" -ForegroundColor Cyan
} catch {
    Write-Host "❌ Ошибка деплоя: $_" -ForegroundColor Red
}

Write-Host ""
Read-Host "Нажми Enter для выхода"
