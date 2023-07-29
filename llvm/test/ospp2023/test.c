#include <stdlib.h>

int my_abs_0_Good (int x, int y) {
  return x>y ? abs(x-y+1): 0;
}

int my_abs_0_Bad (int x, int y) {
  return x<y ? abs(x-y+1): 0;
}

int my_abs_1_Good (int x, int y) {
  return x>y ? abs(x+1-y): 0;
}

int my_abs_1_Bad (int x, int y) {
  return x<y ? abs(x+1-y): 0;
}

int my_abs_2_Good (int x, int y) {
  return x>y ? abs(2*(x-y)): 0;
}

int my_abs_2_Neg (int x, int y) {
  return x<y ? abs(2*(x-y)): 0;
}

int my_abs_3_Bad (int x, int y) {
  return x>y ? abs(x-y-1): 0;
}

int my_abs_3_Neg (int x, int y) {
  return x<y ? abs(x-y-1): 0;
}

int my_abs_4_Neg (int x, int y) {
  return x>y ? abs(y-x-1): 0;
}

int my_abs_4_Bad (int x, int y) {
  return x<y ? abs(y-x-1): 0;
}