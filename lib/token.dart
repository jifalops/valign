class Token {
  static const int CUSTOM = 0;

  static const int WHITESPACE = 1;
  static final RegExp WHITESPACE_RX = new RegExp(r'\s+');

  /// Visible chars
  static const int TEXT = 2;
  static final RegExp TEXT_RX = new RegExp(r'[!-~]+');

  static const int SYMBOLS = 3;
  static final RegExp SYMBOLS_RX = new RegExp(r'[!-/:-@[-`{-~]+');

  static const int WORD_CHARS = 4;
  static final RegExp WORD_CHARS_RX = new RegExp(r'\w+');

  static const int LETTERS = 5;
  static final RegExp LETTERS_RX = new RegExp(r'[A-Za-z]+');

  static const int DIGITS = 6;
  static final RegExp DIGITS_RX = new RegExp(r'[0-9]+');


  // TODO can pass in a function to determine regex from descendent classes.
  /// Returns null if [id] is unknown;
  static RegExp getRegExp(num type) {
    switch (type) {
      case CUSTOM:      return customRegExp;
      case WHITESPACE:  return WHITESPACE_RX;
      case TEXT:        return TEXT_RX;
      case SYMBOLS:     return SYMBOLS_RX;
      case WORD_CHARS:  return WORD_CHARS_RX;
      case LETTERS:     return LETTERS_RX;
      case DIGITS:      return DIGITS_RX;
      default: return null;
    }
  }

  static RegExp customRegExp;


  /// Parse a line into tokens of a specific type;
  static List<Token> parseType(String line, int type) {
    RegExp rx = getRegExp(type);
    if (rx == null) return null;

    var list = new List<Token>();
    rx.allMatches(line).forEach((match) {
      list.add(new Token(type, match.start, match.end - match.start));
    });
    return list;
  }

  static List<Token> parseTypes(String line, List<int> types) {
    var list = new List<Token>();
    types.forEach((type) {
      var sublist = parseType(line, type);
      if (sublist != null) list.addAll(sublist);
    });
    sortByOffset(list);
    return list;
  }

  static void sortByOffset(List<Token> tokens) {
    tokens.sort((a, b) => a.start.compareTo(b.start));
  }

  static List<Token> parse(String line) {
    return parseTypes(line, [TEXT, WHITESPACE]);
  }





  final int type, start, length;
  Token(this.type, this.start, this.length) {}


  @override
  String toString() {
    return '{"type":$type, "start":$start, "length":$length}';
  }
}