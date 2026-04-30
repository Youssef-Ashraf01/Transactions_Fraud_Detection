# NexGen Fraud Guard

Real-Time Transaction Intelligence & Fraud Detection System

## Architecture
- **Kafka** — transaction ingestion (Strimzi on Kubernetes)
- **Spark Structured Streaming** — real-time fraud detection
- **MinIO + Iceberg** — lakehouse (Bronze / Silver / Gold)
- **Redis** — hot layer for sub-millisecond verdicts
- **Kubernetes** — orchestration

## Quick Start

### Prerequisites
- Docker Desktop
- VS Code + Dev Containers extension

### Local Development
1. Open in VS Code
2. Reopen in Container when prompted
3. Start local stack: `docker-compose up -d`
4. Run tests: `pytest tests/unit/`

## Project Structure
- `infrastructure/` — Kubernetes manifests
- `spark-jobs/`     — Spark streaming jobs
- `docker/`         — Dockerfiles for Spark jobs
- `tests/`          — Unit and integration tests
- `scripts/`        — Utility scripts

## Phases
- Phase 1: Local Environment ✅
- Phase 2: Kubernetes Infrastructure ✅
- Phase 3: Spark Jobs
- Phase 4: Deploy to Kubernetes
- Phase 5: Observability
- Phase 6: Production Hardening
