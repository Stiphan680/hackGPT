FROM python:3.10-slim

WORKDIR /app

# Install system dependencies only
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching
COPY requirements.txt .

# Install Python dependencies with proper error handling
RUN pip install --no-cache-dir --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r requirements.txt || true

# Copy application files
COPY . .

# Create required directories
RUN mkdir -p personas output && chmod -R 755 personas output

# Expose Streamlit port
EXPOSE 8501

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
    CMD curl -f http://localhost:8501/_stcore/health || exit 1

# Set environment variables for Streamlit
ENV STREAMLIT_SERVER_HEADLESS=true \
    STREAMLIT_SERVER_PORT=8501 \
    STREAMLIT_SERVER_ADDRESS=0.0.0.0 \
    PYTHONUNBUFFERED=1

# Run Streamlit application
CMD ["streamlit", "run", "hackGPTv23.py", "--server.port=8501", "--server.address=0.0.0.0", "--logger.level=debug"]
