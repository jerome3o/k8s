FROM python:3.11

WORKDIR /app

# copy reqs
COPY requirements.txt /requirements.txt

# install reqs
RUN pip install -r /requirements.txt

# copy main.py
COPY main.py main.py
