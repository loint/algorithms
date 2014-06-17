// STNODE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define maxN 20008

struct node {
        int dinh;
        struct node *next;
};
struct node *ke[maxN], *t;
int n, m, s, f, i, u, v, first, last, Q[maxN * 50], trace[maxN], dd[maxN];

BFS() {
        first = 1;
        last = 1;
        Q[1] = s;
        trace[s] = 20008;
        while (first >= last) {
                u = Q[last++];
                t = ke[u];
                while (t != NULL) {
                        v = t->dinh;
                        if (trace[v] == 0) {
                                trace[v] = u;
                                Q[++first] = v;
                                if (v == f) exit;
                        }
                        t = t->next;
                }
        }
}

Back() {
        int k = f;
        int q = 0;
        while (trace[k] != 0) {
                dd[++q] = k;
                k = trace[k];
        }
        int dem = 0;
        for (i = 2; i <= q - 1; i++) {
                memset(trace, 0, sizeof (trace));
                trace[dd[i]] = maxN * 10;
                BFS();
                if (trace[f] == 0) ++dem;
        }
        printf("%d", dem);
}

int main() {
        scanf("%d%d%d%d", &n, &m, &s, &f);
        for (i = 1; i <= m; i++) {
                t = malloc(sizeof (struct node));
                scanf("%d%d", &u, &v);
                t->dinh = v;
                t->next = ke[u];
                ke[u] = t;
        }
        BFS();
        Back();
        return 0;
}