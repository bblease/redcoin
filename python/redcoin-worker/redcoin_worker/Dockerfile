FROM python:3.8-slim-buster

ENV APP_ROOT /app

RUN mkdir ${APP_ROOT}
WORKDIR ${APP_ROOT}
ADD . ${APP_ROOT}

RUN apt-get update && apt-get -y install build-essential

RUN pip3 install -r requirements.txt
RUN pip3 install -e .

# run the redcoin worker
CMD 'redcoin'