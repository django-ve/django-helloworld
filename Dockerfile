# Use an official Python runtime as a parent image
FROM python:3.6

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

CMD ["apt","install","python3-dev","python3-pip","python3-virtualenv","sqlitebrowser"]
# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

CMD ["python3","manage.py","migrate"]
# Run app.py when the container launches
CMD ["python3", "manage.py","runserver","0.0.0.0:8000"]

