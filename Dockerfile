# Imagen base oficial de pgAdmin4
FROM dpage/pgadmin4:latest

# Render bloquea el entrypoint original, así que lo sustituimos
ENTRYPOINT []

# Ejecutamos pgAdmin directamente con Python
CMD ["python3", "/pgadmin4/pgAdmin4.py"]
