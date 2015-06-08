import 'token.dart';

class TokenGroup {
  final List<Token> tokens;

  TokenGroup(this.tokens) {}

  int start() {
    return tokens[0].start;
  }

  int length() {
    int len = 0;
    tokens.forEach((t) => len += t.text.length);
    return len;
  }

  @override
  String toString() {
    return tokens.join();
  }

  /// Sort [tokenGroups] by their offsets using the [start] method.
  static void sort(List<TokenGroup> tokenGroups) {
    tokenGroups.sort((a, b) => a.start().compareTo(b.start()));
  }

  /// Wraps each [Token] in its own [TokenGroup].
  static List<TokenGroup> perToken(List<Token> tokens) {
    var tg = new List<TokenGroup>();
    tokens.forEach((t) => tg.add(new TokenGroup([t])));
    return tg;
  }
}