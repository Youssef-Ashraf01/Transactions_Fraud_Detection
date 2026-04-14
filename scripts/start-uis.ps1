# ================================================================
# NexGen Fraud Guard - UI Startup Script
# ================================================================

Write-Host ""
Write-Host "Starting NexGen UI tunnels..." -ForegroundColor Blue
Write-Host ""

Write-Host "Starting Kafka UI tunnel..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "kubectl port-forward svc/kafka-ui -n kafka 30080:8080" -WindowStyle Minimized
Start-Sleep -Seconds 2

Write-Host "Starting RedisInsight tunnel..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "kubectl port-forward svc/redis-insight -n fraud-app 30054:5540" -WindowStyle Minimized
Start-Sleep -Seconds 2

Write-Host "Starting MinIO tunnel..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "kubectl port-forward svc/minio-console -n storage 30091:9001" -WindowStyle Minimized
Start-Sleep -Seconds 2

Write-Host "Starting Nessie tunnel..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "kubectl port-forward svc/nessie -n storage 30120:19120" -WindowStyle Minimized
Start-Sleep -Seconds 2

Write-Host "Starting Spark History Server tunnel..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "kubectl port-forward svc/spark-history-server -n monitoring 30180:18080" -WindowStyle Minimized
Start-Sleep -Seconds 3

Write-Host ""
Write-Host "Opening UIs in browser..." -ForegroundColor Green
Start-Process "http://localhost:30080"
Start-Sleep -Seconds 1
Start-Process "http://localhost:30054"
Start-Sleep -Seconds 1
Start-Process "http://localhost:30091"
Start-Sleep -Seconds 1
Start-Process "http://localhost:30180"

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "   All UIs started!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "  Kafka UI:             http://localhost:30080" -ForegroundColor Cyan
Write-Host "  RedisInsight:         http://localhost:30054" -ForegroundColor Cyan
Write-Host "  MinIO Console:        http://localhost:30091" -ForegroundColor Cyan
Write-Host "  Nessie API:           http://localhost:30120" -ForegroundColor Cyan
Write-Host "  Spark History Server: http://localhost:30180" -ForegroundColor Cyan
Write-Host ""
Write-Host "Tunnels running minimized in background." -ForegroundColor Gray
