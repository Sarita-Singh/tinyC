int printStr(char *c);
int printInt(int i);
int readInt(int *eP);

int main () {
  printStr("\nPrint first N fibonacci numbers\n\nCHECK FOR BINARY OP AND LOOP\n\n");

  printStr("\nEnter a value of n: ");
  int i,ep;
  i=readInt(&ep);
  printStr("\nEntered number is: ");
  printInt(i);

  printStr("\n\nThe first ");
  printInt(i);
  printStr(" Fibonacci numbers are:\n\n        ");

  if(i>0) printInt(0);
  printStr(" ");
  if(i>1) printInt(1);
  printStr(" ");
  int a=0,b=1,c;
  for(int j=2;j<i;j++){
    c = a+b;
    printInt(c);
    printStr(" ");
    a = b;
    b = c;

    int r=j/10;
    if(r*10==j){
      printStr("\n        ");
    }
  }
  return 0;
}