FROM python:3.10-slim

WORKDIR /app

# 1. Copy requirements first to leverage Docker cache
COPY requirements.txt . 
RUN pip install --no-cache-dir -r requirements.txt

# 2. Copy the app folder contents into /app
COPY app/ .

# 3. Expose port 80
EXPOSE 80

# 4. Point Gunicorn to "main" module (main.py) and "app" object
CMD ["gunicorn", "-b", "0.0.0.0:80", "main:app"]
