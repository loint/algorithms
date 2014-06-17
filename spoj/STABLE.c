#include <stdio.h>
#include <stdlib.h>
#define maxN 10000

struct node {
        int dinh;
        struct node *next;
};
struct node *ke[maxN], *t;
int n, m, i, s, v, first, last, Q[maxN * 10], trace[maxN], dd[maxN], st[maxN];

BFS() {
        first = 1;
        last = 1;
        Q[1] = s;
        st[s] = 1;
        trace[s] = 10008;
        dd[10008] = maxN * 2;
        while (first >= last) {
                int u = Q[last++];
                t = ke[u];
                while (t != NULL) {
                        v = t->dinh;
                        if (trace[v] == 0) {
                                trace[v] = u;
                                dd[v] = dd[u] + 1;
                                st[v] = st[u];
                                Q[++first] = v;
                        } else
                                if ((trace[v] != u)&&(dd[trace[v]] == dd[u])&&(st[v] < 2)) st[v] = 2;
                        t = t->next;
                }
        }
        int dem = 0;
        for (i = 1; i <= n; i++) if (st[i] == 2) dem++;
        printf("%d", dem);
}

int main() {
        scanf("%d%d%d", &n, &m, &s);
        for (i = 1; i <= m; i++) {
                t = malloc(sizeof (struct node));
                scanf("%d%d", &v, &t->dinh);
                t->next = ke[v];
                ke[v] = t;
        }
        BFS();
        return 0;
}

