# Use uma imagem oficial do Python como imagem base
FROM python:3.9-slim

# Defina o diretório de trabalho no contêiner
WORKDIR /app

# Copie o arquivo de requisitos limpo para o contêiner em /app
COPY requirements.txt .

# Instale quaisquer pacotes necessários especificados em requirements.txt
# --no-cache-dir reduz o tamanho da imagem
RUN pip install --no-cache-dir -r requirements.txt

# Copie o restante do código da aplicação (app.py, models.py, db.py, templates/, static/)
# para o contêiner em /app
COPY . .

# Torne a porta 5000 disponível para o mundo fora deste contêiner (conforme usado em app.py)
EXPOSE 5000

# Comando para executar a aplicação quando o contêiner for iniciado
# Isso usa o bloco if __name__ == "__main__": no seu app.py
CMD ["python", "app.py"]