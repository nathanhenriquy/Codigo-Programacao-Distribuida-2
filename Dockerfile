# Usa imagem oficial do Python
FROM python:3.11

# Define diretório de trabalho
WORKDIR /app

# Copia arquivos para o container
COPY . /app

# Instala dependências
RUN pip install --no-cache-dir -r requirements.txt

# Expõe a porta 5000 (Flask)
EXPOSE 5000

# Executa o app
CMD ["python", "app.py"]
