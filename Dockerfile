FROM ubuntu:20.04

RUN mkdir ./app

RUN chmod 777 ./app

WORKDIR ./app

RUN apt -qq update

ENV TZ=Asia/Kolkata

RUN apt -qq install -y  python3 ffmpeg python3-pip

RUN bash install.sh

COPY requirements.txt .

RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash","start.sh"]
