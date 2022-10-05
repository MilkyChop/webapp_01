FROM ubuntu:18.04
COPY ./requirements.txt /tmp
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get -y update && \
    apt-get -y install python-all python-pip
WORKDIR /tmp
RUN pip install -qr requirements.txt
WORKDIR /opt/webapp
COPY . .
CMD [./app.py]
EXPOSE 5000
