# Imagen base ligera y compatible con Render
FROM python:3.11-alpine

# Evitar buffer en logs
ENV PYTHONUNBUFFERED=1

# Variables de entorno por defecto (puedes cambiarlas desde Render)
ENV PGADMIN_DEFAULT_EMAIL=profesor@centro.edu
ENV PGADMIN_DEFAULT_PASSWORD=admin123
ENV PGADMIN_CONFIG_SERVER_MODE=True

# Instalar dependencias del sistema necesarias para pgAdmin
RUN apk add --no-cache gcc musl-dev libffi-dev openssl-dev postgresql-dev \
    && pip install --upgrade pip \
    && pip install pgadmin4

# Crear volumen para los datos de pgAdmin (config, sesiones, etc.)
VOLUME ["/var/lib/pgadmin"]

# Exponer el puerto que Render usará para acceder al servicio
EXPOSE 80

# Comando de inicio: ejecutar directamente la app Flask de pgAdmin
CMD ["python3", "/usr/local/lib/python3.11/site-packages/pgadmin4/pgAdmin4.py"]

