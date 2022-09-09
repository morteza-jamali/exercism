class ResistorColorDuo {
  List<String> colors = [
    'black',
    'brown',
    'red',
    'orange',
    'yellow',
    'green',
    'blue',
    'violet',
    'grey',
    'white'
  ];

  int value(List<String> colors) {
    int result = 0;

    for (int i = 0; i < 2; i++) {
      colors.asMap().forEach((index, element) {
        if (element == this.colors[i]) {
          result += (1 - i) * 10 * index;
        }
      });
    }

    return result;
  }
}
