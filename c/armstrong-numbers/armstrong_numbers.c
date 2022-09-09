#include "armstrong_numbers.h"

bool is_armstrong_number(int candidate) {
  int num_count = 1;
  int b = candidate / 10;

  while (b) {
    b /= 10;
    ++num_count;
  }

  int subtract = candidate;
  int remainder;

  for (int i = 0; i < num_count; i++) {
    remainder = candidate % 10;
    subtract -= (int) pow((double) remainder, (double) num_count);
    candidate /= 10;
  }

  if (subtract == 0) {
    return true;
  }

  return false;
}