String reverse(String text) {
  if (text.length == 0) {
    return text;
  }

  List<String> result;

  for (int i = 0; i <= text.length; i++) {
    result[i] = text[text.length - i];
  }

  return result.toString();
}
