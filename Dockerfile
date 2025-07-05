
# Use a imagem oficial do Python 3.13.4 baseada no Alpine Linux
FROM python:3.13.4-alpine3.22

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo de requirements para o diretório de trabalho
COPY ./requirements.txt /app/requirements.txt

# Instala as dependências do projeto listadas no requirements.txt, sem usar cache para reduzir o tamanho da imagem e garante que os pacotes sejam atualizados, se necessário.
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

# Copia o código da aplicação para o diretório de trabalho
COPY . /app

# Define o comando para iniciar a aplicação usando Uvicorn.
# O parâmetro --host 0.0.0.0 permite que o contêiner responda a requisições de fora e o parâmetro --port 8000 expõe a aplicação na porta 8000.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
