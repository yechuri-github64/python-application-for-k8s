#FROM python:3.10 AS builder

WORKDIR /app

RUN pip install --no-cache-dir --target=/install flask

# Final production image using a smaller base image
FROM python:3.10-slim

WORKDIR /app

COPY --from=builder /install /app/install
COPY . /app

ENV PYTHONPATH=/app/install

EXPOSE 8080

CMD ["python", "app.py"]
