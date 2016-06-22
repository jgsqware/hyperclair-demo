FROM python
COPY . /src
WORKDIR /src
ENTRYPOINT ["python", "-m", "http.server", "8000"]