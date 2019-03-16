IMAGE?=infer
all: image

linux:
	docker build --build-arg HTTP_PROXY=${http_proxy} -f Dockerfile-$@ -t ${IMAGE}:$@ .

opam: linux
	docker build -f Dockerfile-$@ -t ${IMAGE}:$@ .

clang: opam
	docker build  -f Dockerfile-$@ -t ${IMAGE}:$@ .

image: clang
	docker run --rm -ti ${IMAGE}:$<
