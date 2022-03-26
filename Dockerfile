FROM python:3.8-buster

WORKDIR /app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install psycopg2 dependencies


RUN python -m pip install -U --force-reinstall pip
RUN pip install django
RUN pip install psycopg2
RUN pip install psycopg2-binary
RUN python -m pip install --upgrade Pillow

# copy project
COPY . .

CMD python manage.py makemigrations &&\
    python manage.py migrate && \
    python manage.py runserver 0.0.0.0:8000