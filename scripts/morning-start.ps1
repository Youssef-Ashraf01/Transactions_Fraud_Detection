# ================================================================
# NexGen Fraud Guard - Morning Startup Script
# ================================================================

Write-Host ""
Write-Host "========================================" -ForegroundColor Blue
Write-Host "   NexGen Fraud Guard - Starting Up     " -ForegroundColor Blue
Write-Host "========================================" -ForegroundColor Blue
Write-Host ""

# Step 1: Start Docker Compose
Write-Host "[1/5] Starting local dev stack..." -ForegroundColor Yellow
Set-Location C:\nexgen-fraud-guard
docker compose up -d
Write-Host "      Done." -ForegroundColor Green

# Step 2: Start Minikube
Write-Host "[2/5] Starting Minikube..." -ForegroundColor Yellow
minikube start
Write-Host "      Done." -ForegroundColor Green

# Step 3: Wait for API server to be fully ready
Write-Host "[3/5] Waiting for cluster to stabilize (60 seconds)..." -ForegroundColor Yellow
Start-Sleep -Seconds 60
Write-Host "      Done." -ForegroundColor Green

# Step 4: Wait for all pods to be Running
Write-Host "[4/5] Waiting for all pods to be Ready..." -ForegroundColor Yellow
kubectl wait --for=condition=Ready pod --all --all-namespaces --timeout=300s 2>&1 | Out-Null
Start-Sleep -Seconds 10

# Show final pod status
kubectl get pods --all-namespaces | findstr -v "Completed"
Write-Host "      Done." -ForegroundColor Green

# Step 5: Start UI tunnels
Write-Host "[5/5] Starting UI tunnels..." -ForegroundColor Yellow
& C:\nexgen-fraud-guard\scripts\start-uis.ps1

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "   Ready to work!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
