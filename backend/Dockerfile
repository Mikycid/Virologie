FROM python:3.12.5-bookworm

ENV TZ=Europe/Paris

WORKDIR /app

RUN if [ ! -d "/app/venv" ]; then \
        python -m venv venv; \
    fi

RUN  . /app/venv/bin/activate

WORKDIR /app/src/

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY ./src .