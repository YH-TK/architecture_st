#ベースのDockerイメージをgolangで指定
FROM golang:latest
EXPOSE 5000

#ワークディレクトリを設定する
WORKDIR /go
#ホストのディレクトリを/go配下にコピー
ADD . /go
#GOPATHの設定
ENV GOPATH $GOPATH:$HOME/go
RUN go get github.com/jinzhu/gorm
RUN go get github.com/lib/pq

#main.goを実行
CMD ["go", "run", "main.go"]

