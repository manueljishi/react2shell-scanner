FROM python:3.12-slim

RUN useradd --create-home --shell /bin/bash scanner

WORKDIR /app

# Install dependencies first for better layer caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the scanner script
COPY scanner.py .

RUN chown -R scanner:scanner /app

USER scanner

ENTRYPOINT ["python", "scanner.py"]

