extension StringCleaner on String {
  String?  cleanSpecialCharacters() {
    return replaceAll(RegExp(r'[\[\]"]'), '');
  }
}
