/*
Name -  Sarita Singh
Roll No. - 20CS10053
Assignment No. - 2
*/

#include "myl.h"

int printStr(char *s)
{
    int char_count = 0;

    // find the len of the string
    while (s[char_count] != '\0')
    {
        char_count++;
    }
    // inline asm commands for system call to print s till char_count length to STDOUT
    __asm__ __volatile__(
        "movl $1, %%eax \n\t"
        "movq $1, %%rdi \n\t"
        // making the  syscall
        "syscall \n\t"
        :
        : "S"(s), "d"(char_count));
    return char_count; // returning the length of the string
}

// function to read int from STDIN
int readInt(int *n)
{
    char bufferArray[100] = {0};
    int is_negative = 0;
    // num will store the integer entered by the user
    int num = 0, len;

    // Read the input into the array bufferArray
    __asm__ __volatile__(
        "movl $0, %%eax \n\t"
        "movq $1, %%rdi \n\t"
        "syscall \n\t"
        : "=a"(len)
        : "S"(bufferArray), "d"(sizeof(bufferArray)));

    int i = 0;

    if (len < 0)
        return ERR;

    // increment i when keeping track of the sign of the float num
    if (bufferArray[0] == '-')
    {
        // If negative, mark flag as 1
        is_negative = 1;
        i = 1;
    }
    else if (bufferArray[0] == '+')
    {
        i = 1;
    }
    // traverse the bufferArray until no newline occurs
    for (; bufferArray[i] != '\n' && bufferArray[i] != ' ' && bufferArray[i] != '\t'; i++)
    {
        // if bufferArray[i] is between '0' and '9' then convert the array into integer
        // else return error
        if (bufferArray[i] >= '0' && bufferArray[i] <= '9')
        {
            num = num * 10 + (bufferArray[i] - '0');
        }
        else
        {
            return ERR;
        }
    }

    // if is_negative flag is true then multiply the number with -1
    if (is_negative)
        num *= -1;
    *n = num;  // Point to the integer
    return OK; // return
}

// function to print int to STDOUT
int printInt(int n)
{
    char bufferArray[20], zero = '0';
    int i = 0, j = 0, bytes, k;
    if (n == 0)
        bufferArray[i++] = zero;
    else if (n < 0)
    {
        // if the integer is negative then print '-' sign and multiply n with -1
        bufferArray[i++] = '-';
        n *= -1;
        j++;
    }

    char ch;
    // loop to store decimal representation of integer in reverse order
    while (n)
    {
        ch = (char)(n % 10 + zero);
        bufferArray[i++] = ch;
        n = n / 10;
    }

    bytes = i;
    // loop to reverse the decimal representation and store in bufferArray
    for (k = i - 1; j < k; j++, k--)
    {
        ch = bufferArray[k];
        bufferArray[k] = bufferArray[j];
        bufferArray[j] = ch;
    }
    __asm__ __volatile__(
        "movl $1, %%eax \n\t"
        "movq $1, %%rdi \n\t"
        "syscall \n\t"
        :
        : "S"(bufferArray), "d"(bytes));
    return bytes;
}

// function to read float from STDIN
int readFlt(float *f)
{
    char bufferArray[100] = {0};
    char zero = '0';
    // float num will store the float eneterd by the user
    float float_num = 0;
    int len;

    __asm__ __volatile__(
        "movl $0, %%eax \n\t"
        "movq $0, %%rdi \n\t"
        "syscall \n\t"
        : "=a"(len)
        : "S"(bufferArray), "d"(sizeof(bufferArray)));

    if (len < 0)
        return ERR;

    int is_negative = 0;
    int i = 0;

    // increment i when keeping track of the sign of the float num
    if (bufferArray[i] == '-')
    {
        // If negative, mark flag as 1
        is_negative = 1;
        i = 1;
    }
    else if (bufferArray[i] == '+')
    {
        i = 1;
    }

    while (i < len && (bufferArray[i] >= '0' && bufferArray[i] <= '9'))
    {
        float_num = float_num * 10 + (int)(bufferArray[i] - zero);
        i++;
    }
    if (bufferArray[i] != '\n' && bufferArray[i] != 'E' && bufferArray[i] != 'e' && bufferArray[i] != '.')
        return ERR;

    // increment i at the position of the decimal point
    if (i < len && bufferArray[i] == '.')
    {
        i++;
    }
    float factor = 10.00;
    while (i < len && (bufferArray[i] >= '0' && bufferArray[i] <= '9'))
    {
        float curr = (float)(bufferArray[i] - zero);
        curr /= factor;
        factor *= 10;
        float_num += curr;
        i++;
    }
    if (bufferArray[i] != '\n' && bufferArray[i] != 'E' && bufferArray[i] != 'e')
        return ERR;

    // increment i at the position if 'e' or 'E' is found
    int mfactor = 0, fsign = 0;
    if (i < len && (bufferArray[i] == 'E' || bufferArray[i] == 'e'))
    {
        i++;
    }

    // check the sign of the factor to be multiplied after 'e' is positive or negative
    if (i < len)
    {
        if (bufferArray[i] == '-')
        {
            fsign++;
            i++;
        }
        else if (bufferArray[i] == '+')
        {
            i++;
        }
    }
    while (i < len && (bufferArray[i] >= '0' && bufferArray[i] <= '9'))
    {
        mfactor = mfactor * 10 + (int)(bufferArray[i] - zero);
        i++;
    }
    if (bufferArray[i] != '\n')
        return ERR;

    i = 0;
    // if fsign is 1 then 'e' was followed by '-' sign hence divide the float_num
    if (fsign == 1)
    {
        while (i < mfactor)
        {
            float_num /= 10;
            i++;
        }
    }
    else
    {
        while (i < mfactor)
        {
            float_num *= 10;
            i++;
        }
    }

    // if is_negative flag is true then multiply the number with -1
    if (is_negative)
        float_num *= -1;

    *f = float_num; // point to the float
    return OK;      // return
}

// function to print float to STDOUT
int printFlt(float f)
{
    // array to store the decimal point representation
    char bufferArray[20];

    // integer part of float
    int int_part = (int)f;
    float float_part = f - (float)int_part;
    if (float_part < 0)
        float_part *= -1;

    int len = 7;
    // if f<0 then float number was negative hence print '-' sign
    if (int_part == 0 && f < 0)
        printStr("-");

    len += printInt(int_part);
    bufferArray[0] = '.';

    int i = 1;
    for (i = 1; float_part > 0 && i < 7; i++)
    {
        float_part *= 10;
        int_part = (int)float_part;
        bufferArray[i] = int_part + '0';
        float_part -= int_part;
    }
    // loop for printing 6 digits after the decimal point
    for (; i < 7; i++)
    {
        bufferArray[i] = '0';
    }

    bufferArray[i] = '\0';

    // Now call the function printStr for bufferArray
    printStr(bufferArray);
    return len; // return the length
}
