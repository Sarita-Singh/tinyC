int printInt(int num);
int printStr(char * c);
int readInt(int *eP);
int main()
{
    printStr("\nMultiplying two numbers\n");
    int p;
    printStr("\nEnter first number: ");
    int a = readInt(&p);
    printStr("\nEnter second number: ");
    int b = readInt(&p);
    printStr("Num 1 = ");
    printStr("Num 2 = ");
    printStr("Product = ");
    printInt(a*b);
    printStr("\n");
    return 0;
}