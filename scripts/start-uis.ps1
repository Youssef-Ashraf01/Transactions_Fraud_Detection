# ================================================================
# NexGen Fraud Guard — UI Startup Script
# Run once in the morning. Opens all UIs in background.
# ================================================================

Write-Host ""
Write-Host "Starting NexGen UI tunnels..." -ForegroundColor Blue
Write-Host ""

# Get Minikube IP
$ip = minikube ip
Write-Host "Minikube IP: $ip" -ForegroundColor Gray

# ── Kafka UI ─────────────────────────────────────────────────
Write-Host "Starting Kafka UI tunnel..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", `
    "Write-Host 'Kafka UI — keep this open' -ForegroundColor Cyan; `
     kubectl port-forward svc/kafka-ui -n kafka 30080:8080" `
    -WindowStyle Minimized

Start-Sleep -Seconds 2

# ── RedisInsight ──────────────────────────────────────────────
Write-Host "Starting RedisInsight tunnel..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", `
    "Write-Host 'RedisInsight — keep this open' -ForegroundColor Cyan; `
     kubectl port-forward svc/redis-insight -n fraud-app 30054:5540" `
    -WindowStyle Minimized

Start-Sleep -Seconds 2

# ── MinIO Console ─────────────────────────────────────────────
Write-Host "Starting MinIO tunnel..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", `
    "Write-Host 'MinIO Console — keep this open' -ForegroundColor Cyan; `
     kubectl port-forward svc/minio-console -n storage 30091:9001" `
    -WindowStyle Minimized

Start-Sleep -Seconds 2

# ── Nessie ────────────────────────────────────────────────────
Write-Host "Starting Nessie tunnel..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", `
    "Write-Host 'Nessie API — keep this open' -ForegroundColor Cyan; `
     kubectl port-forward svc/nessie -n storage 30120:19120" `
    -WindowStyle Minimized

Start-Sleep -Seconds 3

# ── Open all UIs in browser ───────────────────────────────────
Write-Host ""
Write-Host "Opening UIs in browser..." -ForegroundColor Green
Start-Process "http://localhost:30080"   # Kafka UI
Start-Sleep -Seconds 1
Start-Process "http://localhost:30054"   # RedisInsight
Start-Sleep -Seconds 1
Start-Process "http://localhost:30091"   # MinIO Console
Start-Sleep -Seconds 1

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  All UIs started!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "  Kafka UI:      http://localhost:30080" -ForegroundColor Cyan
Write-Host "  RedisInsight:  http://localhost:30054" -ForegroundColor Cyan
Write-Host "  MinIO Console: http://localhost:30091" -ForegroundColor Cyan
Write-Host "  Nessie API:    http://localhost:30120" -ForegroundColor Cyan
Write-Host ""
Write-Host "Tunnels are running minimized in background." -ForegroundColor Gray
Write-Host "Close this window when done for the day." -ForegroundColor Gray
