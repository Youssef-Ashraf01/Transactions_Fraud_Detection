# ================================================================
# NexGen Fraud Guard - Evening Shutdown Script
# ================================================================

Write-Host ""
Write-Host "Shutting down NexGen Fraud Guard..." -ForegroundColor Yellow

Write-Host "Stopping Minikube..." -ForegroundColor Gray
minikube stop

Write-Host "Stopping local dev stack..." -ForegroundColor Gray
Set-Location C:\nexgen-fraud-guard
docker compose down

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   All stopped. See you tomorrow!" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
