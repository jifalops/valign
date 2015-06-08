import 'token_group.dart';

class Line {
  final String text;
  final List<TokenGroup> tokenGroups;

  Line(this.text, this.tokenGroups) {
    TokenGroup.sortByOffset(tokenGroups);
  }

  @override
  String toString() {
    return '{"text":"$text", "tokenGroups":[' + tokenGroups.join(', ') + ']}';
  }
}