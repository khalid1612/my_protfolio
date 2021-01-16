import 'package:profanity_filter/profanity_filter.dart';

class Utils {
  static List<String> badWordContains(String text) {
    String filterText = "";

    for (int i = 0; i < text.length; i++) {
      if (text[i].contains(RegExp('[a-zA-Z]'))) {
        filterText += text[i];
      }
    }

    List<String> wordsFound = ProfanityFilter().getAllProfanity(filterText);
    wordsFound.remove("ass");

    return wordsFound;
  }
}
