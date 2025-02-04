FROM python:3.9

# No generar archivos .pyc
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# Crear directorio de trabajo
WORKDIR /app

# Copiar archivos
COPY . .

# Instalar dependencias
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Exponer el puerto 10000 (Render usa este puerto)
EXPOSE 10000

# Comando para correr Django
CMD ["gunicorn", "--bind", "0.0.0.0:10000", "software_pro.wsgi:application"]
