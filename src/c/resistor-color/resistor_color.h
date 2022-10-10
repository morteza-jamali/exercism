#ifndef RESISTOR_COLOR_H
#define RESISTOR_COLOR_H

typedef enum {
  COLOR_START,
  BLACK,
  BROWN,
  RED,
  ORANGE,
  YELLOW,
  GREEN,
  BLUE,
  VIOLET,
  GREY,
  WHITE,
  COLOR_TAIL
} resistor_band_t;

int color_code(resistor_band_t color);
resistor_band_t* colors();
#endif
