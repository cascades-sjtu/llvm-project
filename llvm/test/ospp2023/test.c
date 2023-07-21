#include <stdlib.h>

int my_abs_1 (int x, int y) {
  return x>y ? abs(x+1-y): 0;
}

int my_abs_2 (int x, int y) {
  return x>y ? abs(2*(x-y)): 0;
}

int my_abs_3 (int x, int y) {
  return x>y ? abs(x-y-1): 0;
}

int my_abs_4 (int x, int y) {
  return x>y ? abs(y-x-1): 0;
}
