# Imagen base oficial de pgAdmin4
FROM dpage/pgadmin4:latest

# Render necesita un comando explícito
CMD ["python3", "/pgadmin4/pgAdmin4.py"]
