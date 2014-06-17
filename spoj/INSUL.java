import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.StringTokenizer;

class INSUL {
        public static void main(String[] args) {
                InputStream inputStream = System.in;
                OutputStream outputStream = System.out;
                InputReader input = new InputReader(inputStream);
                PrintWriter output = new PrintWriter(outputStream);
                int[] c=new int[10005]; 
                int n=input.nextInt();
                long sum=0;
                for (int i=1;i<=n;i++){
                        int tam=input.nextInt();
                        sum+=tam; c[tam]++;
                }
                int i=0,j=10000,dem=0;
                while (true){
                       if (dem==n/2) {break;}
                       while (c[i]==0) {i++;}
                       while (c[j]==0) {j--;}
                        sum+=j-i;
                        c[i]--; c[j]--; dem++;
             }
           output.print(sum);
           output.close();		
        }
}

class InputReader {
        private BufferedReader reader;
        private StringTokenizer tokenizer;
        
        public InputReader(InputStream stream) {
                reader = new BufferedReader(new InputStreamReader(stream));
                tokenizer = null;
        }
        public String next() {
                while (tokenizer == null || !tokenizer.hasMoreTokens()) {
                        try {
                                tokenizer = new StringTokenizer(reader.readLine());
                        } catch (IOException e) {
                                throw new RuntimeException(e);
                        }
                }
                return tokenizer.nextToken();
        }

        public int nextInt() {
                return Integer.parseInt(next());
        }
}


