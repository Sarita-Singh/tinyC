int printStr(char *c);
int printInt(int i);
int readInt(int *eP);

int b = 1;
char c;
char d = 'a';

int add (int a, int b) {
  int ans;
  int*p;
  printStr("Inside function body\n");
  ans = a+b;
  printStr("Returning from function\n");
  return ans;
}
int main () {
  int d, arr[10];
  int*p;
  int x, y, z;
  int eP;
  printStr("\nTracing function steps\n\n");
  printStr("\nEnter first number: ");
  x = readInt(&eP);
  printStr("\nEnter second number: ");
  y = readInt(&eP);
  printStr("\n\nPassing to the function\n");
  z = add(x,y);
  printStr("\nSum = ");
  printInt(z);
  printStr("\n");
  return 0;
}
