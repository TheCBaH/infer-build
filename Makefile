IMAGE?=infer
all: image

linux:
	docker build -f Dockerfile-$@ -t ${IMAGE}:$@ .

opam: linux
	docker build -f Dockerfile-$@ -t ${IMAGE}:$@ .

clang: opam
	docker build --cpuset-cpus 1 -f Dockerfile-$@ -t ${IMAGE}:$@ .

image: clang
	docker run --rm -ti ${IMAGE}:$<
