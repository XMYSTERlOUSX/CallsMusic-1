FROM debian:latest

RUN apt update && apt upgrade -y
RUN apt install git curl python3-pip ffmpeg -y
RUN pip3 install -U pip
RUN curl -sL https://deb.nodesource.com/setup_15.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g npm
RUN cd / && \
    git clone https://github.com/Anjana-Ma/CallsMusic && \
    cd / && \
    rm -r .git && \
    git clone https://github.com/pytgcalls/pytgcalls && \
    cd pytgcalls/ && \
    rm -r .git && \
    npm install && \
    npm run prepare && \
    cd pytgcalls/js && \
    npm install && \
    cd ../../ && \
    pip3 install -r requirements.txt && \
    cd / && \
    pip3 install -r requirements.txt
WORKDIR /
CMD python3 main.py
