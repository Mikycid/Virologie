FROM python:3.12.5-bookworm

COPY ./venv /app/venv
RUN  . /app/venv/bin/activate

WORKDIR /app/src/

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY ./src .

# CMD [ "python", "-u", "server.py" ]