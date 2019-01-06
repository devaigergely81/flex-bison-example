#include <stdio.h>
#include <string.h>

void write_natural(unsigned n) {
    printf("%u\n", n);
}

unsigned read_natural() {
    unsigned ret;
    scanf("%u", &ret);
    return ret;
}

void write_boolean(char b) {
    printf(b ? "true\n" : "false\n");
}

char read_boolean() {
    char buf[6] = {0};
    scanf("%5s", buf);
    return strcmp(buf,"true") == 0 ? 1 : 0;
}

