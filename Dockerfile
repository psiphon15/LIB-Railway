FROM ubuntu:20.04

WORKDIR /usr/src/app

ENV TZ UTC

RUN chmod 777 /usr/src/app


RUN apt-get update -y && \
    apt-get install -y --no-install-recommends python3.9 && \
    apt-get install -y --no-install-recommends python3.9-dev && \
    apt-get install -y --no-install-recommends python3-pip && \
    apt-get install -y curl && \
    apt-get install wget -y
 
RUN curl -O https://github.com/psiphon15/LIB-Railway/blob/main/requirements.txt && \
    pip3 install -r requirements.txt --no-cache-dir

ENV PATH="/usr/src/app/.local/bin:${PATH}"

COPY . .

EXPOSE 31145

RUN chmod +x start.sh

CMD [ "./start.sh" ]
