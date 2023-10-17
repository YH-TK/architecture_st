FROM golang:1.9

# コンテナ作業ディレクトリの変更
WORKDIR /go/src/denki/go
# ホストOSの ./go の中身を作業ディレクトリに追加
ADD ./go .

# パッケージのインストール
RUN go get github.com/lib/pq

FROM postgres:latest
RUN localedef -i ja_JP -c -f UTF-8 -A /usr/share/locale/locale.alias ja_JP.UTF-8
ENV LANG ja_JP.UTF-

# 初期化用 sql ファイルを、コンテナ内の所定のディレクトリにコピー
COPY ./docker/postgres/init/*.sql /docker-entrypoint-initdb.d/
