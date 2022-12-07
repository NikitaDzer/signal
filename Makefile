CC     = gcc
LFLAGS = -fsanitize=address
CFLAGS = -O2 -fsanitize=address

BDIR = ./build
EXEC = sync


all: $(EXEC)

$(EXEC): $(BDIR) $(BDIR)/main.o $(BDIR)/sender.o $(BDIR)/receiver.o \
	 $(BDIR)/shmem.o $(BDIR)/signal.o
	$(CC) $(LFLAGS) -o $(EXEC) \
	$(BDIR)/main.o $(BDIR)/sender.o \
	$(BDIR)/receiver.o $(BDIR)/shmem.o $(BDIR)/signal.o

$(BDIR)/main.o: main.c
	$(CC) -c $(CFLAGS) main.c -o $(BDIR)/main.o

$(BDIR)/sender.o: sender.c
	$(CC) -c $(CFLAGS) sender.c -o $(BDIR)/sender.o

$(BDIR)/receiver.o: receiver.c
	$(CC) -c $(CFLAGS) receiver.c -o $(BDIR)/receiver.o

$(BDIR)/shmem.o: shmem.c
	$(CC) -c $(CFLAGS) shmem.c -o $(BDIR)/shmem.o

$(BDIR)/signal.o: signal.c
	$(CC) -c $(CFLAGS) signal.c -o $(BDIR)/signal.o

$(BDIR):
	mkdir -p $(BDIR)

clean:
	rm -rf $(BDIR) $(EXEC)
