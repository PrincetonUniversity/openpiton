#define FAKE_UART_ADDRESS 0XFFF0C2C000

// prints a cstring via the fake UART
void printStr(char * str) {
  volatile char * uartAddr = (char*)FAKE_UART_ADDRESS;
  int k=0;
  while(str[k]!='\0') {
    (*uartAddr) = str[k++];
  }
  return;
}

// inserts number with dig digits at position pos in string
void num2str(char * str, int num, int pos, int dig) {
  for (int k=dig-1; k>=0; k--) {
    str[pos+k] = num % 10 + '0';
    num /= 10;
  }
  return;
}

// GOOD pass trap for the TB, do not modify the function name
volatile void pass () {
  return;
}

// BAD fail trap for the TB, do not modify the function name
volatile void fail () {
  return;
}

// global synchronization variable
volatile int amo_cnt=0;
const    int one=1;

// this is a simple test program that just prints
// hello world 32 times to the UART
int main(int argc, void ** argv) {

  char coreMsg[] = "hello world, this is hart   !\n";

  // synchronize with other cores and wait until it is this core's turn
  while(amo_cnt != argc);

  // assemble number and print
  num2str(coreMsg, argc, 27, 2);
  printStr(coreMsg);

  // increment amo counter
  __asm__ __volatile__ (  " amoadd.d zero, %1, %0" : "+A" (amo_cnt) : "r" (one) : "memory");

  // hit pass trap and exit
  pass();
  return 0;
}