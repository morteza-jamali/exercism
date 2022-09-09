List<List<String>> scores = [
  ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
  ['D', 'G'],
  ['B', 'C', 'M', 'P'],
  ['F', 'H', 'V', 'W', 'Y'],
  ['K'],
  ['J', 'X'],
  ['Q', 'Z']
];

int score(String text) {
  int result = 0;

  for (int i = 0; i < text.length; i++) {
    for (List<String> words in scores) {
      result +=
          words.contains(text[i].toUpperCase()) ? scores.indexOf(words) + 1 : 0;
    }
  }

  return result;
}
