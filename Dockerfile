# Imagen base ligera y compatible con Render
FROM python:3.11-alpine

# Evitar buffer en logs
ENV PYTHONUNBUFFERED=1

# Variables de entorno por defecto (se pueden redefinir en Render)
ENV PGADMIN_DEFAULT_EMAIL=profesor@centro.edu
ENV PGADMIN_DEFAULT_PASSWORD=admin123
ENV PGADMIN_CONFIG_SERVER_MODE=True
ENV PGADMIN_LISTEN_PORT=80
ENV PGADMIN_LISTEN_ADDRESS=0.0.0.0
ENV PGADMIN_SETUP_EMAIL=${PGADMIN_DEFAULT_EMAIL}
ENV PGADMIN_SETUP_PASSWORD=${PGADMIN_DEFAULT_PASSWORD}

# Instalar dependencias del sistema necesarias
RUN apk add --no-cache gcc musl-dev libffi-dev openssl-dev postgresql-dev bash \
    && pip install --upgrade pip \
    && pip install pgadmin4

# Crear volumen para datos
VOLUME ["/var/lib/pgadmin"]

# Exponer el puerto para Render
EXPOSE 80

# Script de arranque que inicializa pgAdmin automáticamente y lo expone en 0.0.0.0
CMD bash -c "\
    echo '🔧 Inicializando base de datos de pgAdmin...' && \
    export PGADMIN_LISTEN_PORT=80 && \
    export PGADMIN_LISTEN_ADDRESS=0.0.0.0 && \
    python3 /usr/local/lib/python3.11/site-packages/pgadmin4/pgAdmin4.py"
