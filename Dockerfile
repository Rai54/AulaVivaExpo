
# Imagen de prueba para el staging de AulaViva
FROM nginx:stable-alpine

LABEL org.opencontainers.image.title="AulaViva Staging"

RUN printf '%s\n' \
    '<!DOCTYPE html>' \
    '<html lang="es">' \
    '<head><meta charset="UTF-8"><title>AulaViva Staging</title></head>' \
    '<body><h1>AulaViva - Staging</h1><p>Imagen de prueba para Cosign y Kyverno.</p></body>' \
    '</html>' \
    > /usr/share/nginx/html/index.html

EXPOSE 80
