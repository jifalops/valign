class Token {
  static final RegExp WHITESPACE = new RegExp(r'\s+');
  /// Visible chars
  static final RegExp TEXT = new RegExp(r'[!-~]+');
  static final RegExp SYMBOLS = new RegExp(r'[!-/:-@[-`{-~]+');
  static final RegExp WORD_CHARS = new RegExp(r'\w+');
  static final RegExp LETTERS = new RegExp(r'[A-Za-z]+');
  static final RegExp DIGITS = new RegExp(r'[0-9]+');


  /// Parse a line into tokens of a specific type;
  static List<Token> parse(String line, RegExp regex) {
    var list = new List<Token>();
    regex.allMatches(line).forEach((match) {
      list.add(new Token(line.substring(match.start, match.end), match.start, regex));
    });
    return list;
  }

  /// Sorts [tokens] by their [start] property.
  static void sort(List<Token> tokens) {
    tokens.sort((a, b) => a.start.compareTo(b.start));
  }

  /// [start] is the offset from the beginning of the line where [text] starts.
  final int start;
  final String text;
  /// The regular expression used to extract [text].
  final RegExp regex;

  Token(this.text, this.start, this.regex) {}


  @override
  String toString() {
    return text;
  }
}