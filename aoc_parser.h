#include <stdio.h>
#include <stdlib.h>

struct line {
	char* content;
	int size;
	int capacity;
};

struct line* init_line() {
	struct line* l = (struct line*) malloc(sizeof(struct line));
	l->content = (char*) malloc(sizeof(char) * 256);
	l->size = 0;
	l->capacity = 256;
	return l;
}

struct line* get_line(FILE* f) {
	struct line* l = init_line();
	char ch;
	while((ch = fgetc(f)) != EOF) {
		if(ch == '\n') {
			return l;
		}
		if(l->size == l->capacity) {
			l->content = realloc(l->content, l->capacity * 2);
			l->capacity = 2 * l->capacity;
		}
		(l->content)[l->size++] = ch;
	}
	return l;
}	
