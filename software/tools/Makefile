CC=gcc

all:	genmeminit genraminit

genmeminit: genmeminit.c
	${CC} $^ -o $@

genraminit: genraminit.c
	${CC} $^ -o $@

clean:
	rm -f genraminit genmeminit