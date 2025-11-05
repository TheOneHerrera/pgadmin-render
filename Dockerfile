FROM python:3.11-alpine

ENV PYTHONUNBUFFERED=1

# Variables de entorno principales
ENV PGADMIN_DEFAULT_EMAIL=profesor@centro.edu
ENV PGADMIN_DEFAULT_PASSWORD=admin123
ENV PGADMIN_CONFIG_SERVER_MODE=True
ENV PGADMIN_CONFIG_MASTER_PASSWORD_REQUIRED=False
ENV PGADMIN_CONFIG_ENHANCED_COOKIE_PROTECTION=False

# Configurar pgAdmin para escuchar en 0.0.0.0:80
ENV PGADMIN_CONFIG_LISTEN_ADDRESS='0.0.0.0'
ENV PGADMIN_CONFIG_LISTEN_PORT=80

RUN apk add --no-cache gcc musl-dev libffi-dev openssl-dev postgresql-dev bash \
    && pip install --upgrade pip \
    && pip install pgadmin4

VOLUME ["/var/lib/pgadmin"]

EXPOSE 80

CMD bash -c "\
    echo '🔧 Inicializando base de datos de pgAdmin...' && \
    python3 /usr/local/lib/python3.11/site-packages/pgadmin4/pgAdmin4.py"

