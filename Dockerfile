# Use an official Python runtime as a parent image
FROM python:3.11

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install necessary packages and any needed packages specified in requirements.txt
RUN apt-get update && apt-get install -y python3-dev python3-pip sqlite3 && pip install -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Run migrations and then start the server
CMD ["sh", "-c", "python3 manage.py migrate && python3 manage.py runserver 0.0.0.0:8000"]
