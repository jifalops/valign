import 'line_group.dart';

class AlignedDoc {
  final List<LineGroup> lineGroups;

  AlignedDoc(this.lineGroups);

  @override
  String toString() {
    return lineGroups.join(r'\n\n');
  }
}