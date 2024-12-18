# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port the app runs on (Flask default port is 5000)
EXPOSE 5000

# Define environment variables (optional)
ENV FLASK_APP=first_app.py
ENV FLASK_ENV=production

# Run the Flask app using the `flask run` command
CMD ["flask", "run", "--host=0.0.0.0"]
