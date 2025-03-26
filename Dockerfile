FROM apache/superset:latest

USER root

RUN apt-get update

RUN apt-get install -y \
    default-mysql-client \
    build-essential

RUN pip install mysqlclient

CMD ["sh", "-c", "superset db upgrade && superset init && superset run -p 8088 --with-threads --reload --debugger"]