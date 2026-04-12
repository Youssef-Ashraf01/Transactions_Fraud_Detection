# ================================================================
# NexGen Fraud Guard — Evening Shutdown Script
# ================================================================

Write-Host ""
Write-Host "Shutting down NexGen Fraud Guard..." -ForegroundColor Yellow

# Stop all port-forward processes
Write-Host "Stopping UI tunnels..." -ForegroundColor Gray
Get-Process -Name "kubectl" -ErrorAction SilentlyContinue | `
    Where-Object { $_.CommandLine -like "*port-forward*" } | `
    Stop-Process -Force -ErrorAction SilentlyContinue

# Stop Minikube
Write-Host "Stopping Minikube..." -ForegroundColor Gray
minikube stop

# Stop Docker Compose
Write-Host "Stopping local dev stack..." -ForegroundColor Gray
Set-Location C:\nexgen-fraud-guard
docker compose down

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   All stopped. See you tomorrow!       " -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
