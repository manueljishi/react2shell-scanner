FROM python:3.12-slim

WORKDIR /app

# Install dependencies first for better layer caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the scanner script
COPY scanner.py .

# Make the script executable
RUN chmod +x scanner.py

ENTRYPOINT ["python", "scanner.py"]

