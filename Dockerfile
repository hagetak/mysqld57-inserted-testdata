
# based image
# ref: https://github.com/docker-library/mysql/blob/6c414e7f38c2079c7193beae5dc7c34ee46cd6e7/5.7/Dockerfile
FROM mysql:5.7

# enable Japanese
# ref: https://qiita.com/muff1225/items/48e0753e7b745ec3ecbd
# Set debian default locale to ja_JP.UTF-8
RUN apt-get update && \
    apt-get install -y locales && \
    rm -rf /var/lib/apt/lists/* && \
    echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8

# Set MySQL character
RUN { \
    echo '[mysqld]'; \
    echo 'character-set-server=utf8mb4'; \
    echo 'collation-server=utf8mb4_general_ci'; \
    echo '[client]'; \
    echo 'default-character-set=utf8mb4'; \
} > /etc/mysql/conf.d/charset.cnf

# set initial data
COPY data/00_create_database_and_data.sql /docker-entrypoint-initdb.d/00_create_database_and_data.sql
