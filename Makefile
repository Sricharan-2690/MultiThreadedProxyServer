# using g++ works because C is valid in C++ compiler too.
CC=g++

# Flags passed to compiler:
# -g → include debugging info
# -Wall → show all warnings (helpful)

CFLAGS= -g -Wall 

# running make automatically builds the proxy.
all: proxy

# -c = compile only, don’t link
proxy: proxy_server_with_cache.c
# Compile proxy_parse.c to object file	
	$(CC) $(CFLAGS) -o proxy_parse.o -c proxy_parse.c -lpthread  
# Compile main server file to proxy.o
	$(CC) $(CFLAGS) -o proxy.o -c proxy_server_with_cache.c -lpthread
# Link those .o files together
	$(CC) $(CFLAGS) -o proxy proxy_parse.o proxy.o -lpthread

clean:
	rm -f proxy *.o

tar:
	tar -cvzf ass1.tgz proxy_server_with_cache.c README Makefile proxy_parse.c proxy_parse.h
