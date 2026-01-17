extension on String {
  getFirstCharacter() {
    return this[0];
  }
}

void main() {
  final String text = "Extension methods in dart";
  print(text.getFirstCharacter()); //prints the first character
}
