FROM python:3.7
ENV PYTHONUNBUFFERED 1
ARG WORKING_dir=/app

RUN mkdir -p $WORKING_dir
WORKDIR $WORKING_dir

COPY requirements.txt .

RUN pip3 install -r requirements.txt

EXPOSE 8000

CMD ["gunicorn", "--chdir", "hello", "--bind", ":8000", "hello.wsgi:application"]
