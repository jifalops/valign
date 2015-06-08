import 'token_group.dart';

class Line {
  final List<TokenGroup> tokenGroups;

  Line(this.tokenGroups) {}

  @override
  String toString() {
    return tokenGroups.join(' ');
  }
}