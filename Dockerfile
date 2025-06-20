
# Use a stable Python version (3.10 is safe for Django 3.2)
FROM python:3.10

# Set working directory inside the container
WORKDIR /data

# Copy only requirements first (for better caching)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Run Django migrations
RUN python manage.py migrate

# Expose port 8000 to the host
EXPOSE 8000

# Run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
