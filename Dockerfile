# Imagen base ligera compatible con Render
FROM python:3.11-alpine

# Evita problemas de permisos
ENV PYTHONUNBUFFERED=1
ENV PGADMIN_DEFAULT_EMAIL=profesor@centro.edu
ENV PGADMIN_DEFAULT_PASSWORD=admin123
ENV PGADMIN_CONFIG_SERVER_MODE=True

# Instalar dependencias necesarias
RUN apk add --no-cache gcc musl-dev libffi-dev openssl-dev postgresql-dev \
    && pip install --upgrade pip \
    && pip install pgadmin4

# Crear volumen para datos
VOLUME ["/var/lib/pgadmin"]

# Exponer el puerto 80
EXPOSE 80

# Ejecutar pgAdmin en modo servidor
CMD ["python3", "-m", "pgadmin4"]

