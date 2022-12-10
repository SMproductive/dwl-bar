CC=gcc
CFLAGS = -std=c99 -pedantic -Wall -Wno-deprecated-declarations -Os ${INCS} ${CPPFLAGS}
LIBS = ${shell pkg-config --libs gtk4} ${shell pkg-config --cflags gtk4}

SRC = dwl-bar.c
OBJ = ${SRC:.c=.o}
all: dwl-bar

.c.o:
	${CC} -c ${CFLAGS} ${LIBS} $<

${OBJ}: config.h

config.h:
	cp config.def.h $@

dwl-bar: ${OBJ}
	${CC} -o $@ ${OBJ} ${LIBS}

# dwl-bar: dwl-bar.c
# 	${CC} $< ${CFLAGS} ${LIBS} -o $@

clean:
	rm -f dwl-bar ${OBJ}

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f dwl-bar ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/dwl-bar

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/dwl-bar
