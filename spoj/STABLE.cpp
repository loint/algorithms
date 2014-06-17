#include <iostream>
#include <cstdio>
#include <cstdlib>

#define maxN 20000

using namespace std;

class Node {
	public:
		int dinh;
		Node *next;
};

Node *ke[maxN], *t;
int n, m, i, s, v, first, last, Q[maxN * 10], trace[maxN], dd[maxN], st[maxN];

void BFS() {
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
        cout<<dem;
}

void openFile()
{
	freopen("input.txt","r+",stdin);
	freopen("output.txt","w+",stdout);
}

int main() {
	//openFile();
      cin>>n>>m>>s;
        for (i = 1; i <= m; i++) {
                Node *t= new Node();
                cin>>v>>t->dinh;
                t->next = ke[v];
                ke[v] = t;
        }
        BFS();
        return 0;
}

