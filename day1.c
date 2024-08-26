#include "aoc_parser.h"

int main() {
	FILE* f;
	f = fopen("day1.txt", "r");
	struct line* l;
	int ret = 0;
	for(;;) {
		l = get_line(f);
		if(l->size == 0) break;
		char f = 0;
		char b = 0;
		int val = 0;
		int len = l->size;
		for(int i = 0; i < len; i++) {
			if(!f && l->content[i] > 47 && l->content[i] < 58) {
				val = val + 10 * (l->content[i] - 48);
				f = 1;
			}
			if(!b && l->content[len-1-i] > 47 && l->content[len-1-i] < 58) {
				val = val + (l->content[len-1-i] - 48);
				b = 1;
			}
			if(b && f) break;
		}
		free(l);
		ret += val;
	}
	printf("%d", ret);
	return 0;
}
