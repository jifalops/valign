import 'token.dart';

class TokenGroup {
  final List<Token> tokens;

  TokenGroup(this.tokens) {
    Token.sortByOffset(tokens);
  }

  int start() {
    return tokens[0].start;
  }

  int length() {
    int len = 0;
    tokens.forEach((t) => len += t.length);
    return len;
  }

  @override
  String toString() {
    return '{"tokens":[' + tokens.join(', ') + ']}';
  }

  static void sortByOffset(List<TokenGroup> tokenGroups) {
    tokenGroups.sort((a, b) => a.start().compareTo(b.start()));
  }

  static List<TokenGroup> wrapTokens(List<Token> tokens) {
    var tg = new List<TokenGroup>();
    tokens.forEach((t) => tg.add(new TokenGroup([t])));
    return tg;
  }
}