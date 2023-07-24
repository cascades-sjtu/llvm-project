#include <stdlib.h>

int my_abs_1_Good (int x, int y) {
  return x>y ? abs(x+1-y): 0;
}

int my_abs_2_Good (int x, int y) {
  return x>y ? abs(2*(x-y)): 0;
}

int my_abs_3_Bad (int x, int y) {
  return x>y ? abs(x-y-1): 0;
}

int my_abs_4_Good (int x, int y) {
  return x>y ? abs(y-x-1): 0;
}

int my_abs_5_Bad (int x, int y) {
  return x<y ? abs(x+1-y): 0;
}

int my_abs_6_Good (int x, int y) {
  return x<y ? abs(2*(x-y)): 0;
}

int my_abs_7_Good (int x, int y) {
  return x<y ? abs(x-y-1): 0;
}

int my_abs_8_Bad (int x, int y) {
  return x<y ? abs(y-x-1): 0;
}