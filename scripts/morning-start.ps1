# ================================================================
# NexGen Fraud Guard — Morning Startup Script
# Run this every morning. Does everything in one command.
# ================================================================

Write-Host ""
Write-Host "========================================" -ForegroundColor Blue
Write-Host "   NexGen Fraud Guard — Starting Up     " -ForegroundColor Blue
Write-Host "========================================" -ForegroundColor Blue
Write-Host ""

# ── Step 1: Start Docker Compose local stack ──────────────────
Write-Host "[1/4] Starting local dev stack (Docker Compose)..." -ForegroundColor Yellow
Set-Location C:\nexgen-fraud-guard
docker compose up -d
Write-Host "      Done." -ForegroundColor Green

# ── Step 2: Start Minikube ────────────────────────────────────
Write-Host "[2/4] Starting Minikube..." -ForegroundColor Yellow
minikube start
Write-Host "      Done." -ForegroundColor Green

# ── Step 3: Verify cluster health ────────────────────────────
Write-Host "[3/4] Checking cluster health..." -ForegroundColor Yellow
Start-Sleep -Seconds 15
kubectl get nodes
kubectl get pods --all-namespaces | findstr -v "Completed"
Write-Host "      Done." -ForegroundColor Green

# ── Step 4: Start UI tunnels ──────────────────────────────────
Write-Host "[4/4] Starting UI tunnels..." -ForegroundColor Yellow
& C:\nexgen-fraud-guard\scripts\start-uis.ps1
Write-Host ""

Write-Host "========================================" -ForegroundColor Green
Write-Host "   Ready to work!                       " -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
