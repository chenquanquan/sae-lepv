FROM debian:stretch

ADD ./nginx/default /etc/nginx/sites-enabled/
ADD ./app/frp/frps /sbin
ADD ./app /app
ADD ./docker/run.sh /app
ADD ./debian-tuna-sources.list /app

ENV PYTHONPATH /

#EXPOSE 5050

WORKDIR /app

RUN apt update && apt install -y apt-transport-https

RUN mv debian-tuna-sources.list /etc/apt/sources.list

RUN apt update && apt install -y \
    python3-pip \
    gunicorn3 \
    nginx-full

RUN ["pip3", "install", "-r", "requirements.txt"]

RUN chmod +x run.sh
CMD ["./run.sh"]

