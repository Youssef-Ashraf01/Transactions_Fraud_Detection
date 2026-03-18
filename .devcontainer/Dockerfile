FROM ubuntu:22.04

# Prevent timezone prompts during install
ENV DEBIAN_FRONTEND=noninteractive

# Java and Python environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"
ENV PYSPARK_PYTHON=python3.11
ENV PYSPARK_DRIVER_PYTHON=python3.11

# ── System packages ───────────────────────────────────────────
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    python3.11 \
    python3.11-venv \
    python3-pip \
    python3.11-dev \
    build-essential \
    curl \
    git \
    vim \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Make python3.11 the default python3
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1
RUN update-alternatives --install /usr/bin/python  python  /usr/bin/python3.11 1

# Upgrade pip
RUN pip install --upgrade pip

# ── Python packages ───────────────────────────────────────────
RUN pip install \
    pyspark==3.5.0 \
    kafka-python-ng==2.2.3 \
    redis==5.0.1 \
    pyiceberg==0.6.0 \
    pytest==7.4.0 \
    black==23.12.0

# ── Working directory ─────────────────────────────────────────
WORKDIR /workspace

# ── Verify everything on build ────────────────────────────────
RUN echo "=== Verification ===" \
    && java -version \
    && python3 --version \
    && python3 -c "import pyspark; print('PySpark', pyspark.__version__)" \
    && python3 -c "from kafka import KafkaProducer; print('kafka OK')" \
    && python3 -c "import redis; print('redis', redis.__version__)" \
    && python3 -c "import pyiceberg; print('pyiceberg', pyiceberg.__version__)"