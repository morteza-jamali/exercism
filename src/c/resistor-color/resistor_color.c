#include "resistor_color.h"

static resistor_band_t all_colors[10];

int color_code(resistor_band_t color) {
  return (int)color - 1;
}

resistor_band_t* colors() {
  for (resistor_band_t c = COLOR_START + 1; c < COLOR_TAIL; ++c) {
    all_colors[c - 1] = c;
  }

  return all_colors;
}
