FROM python:3.13.5-alpine3.22

WORKDIR /app

RUN apk update
RUN apk upgrade
RUN apk add --no-cache ffmpeg
RUN pip install --no-cache-dir uv

COPY pyproject.toml .
RUN uv sync --no-install-project

COPY . .

CMD ["uv", "run", "--no-sync", "python", "main.py"]
