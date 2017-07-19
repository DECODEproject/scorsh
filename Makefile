BUILD=go build

SERVER_SOURCES=scorshd.go \
types.go \
config.go \
spooler.go \
commits.go \
workers.go

all: scorshd

deps:
	go get 'github.com/fsnotify/fsnotify'
	go get 'github.com/libgit2/git2go'
	go get 'github.com/go-yaml/yaml'
	go get 'golang.org/x/crypto/openpgp'

scorshd: $(SERVER_SOURCES)
	$(BUILD) scorshd.go types.go config.go spooler.go commits.go workers.go

clean:
	rm scorshd
