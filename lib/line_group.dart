import 'line.dart';

class LineGroup {
  final List<Line> lines;

  LineGroup(this.lines) {}

  List<int> measureColWidths() {

    // Count the max number of columns in a line.
    int numCols = 0;
    var colWidths = new List<int>();
    lines.forEach((line) {
      if (line.tokenGroups.length > numCols) {
        numCols = line.tokenGroups.length;
      }
    });

    // Find the widest tokengroup in each column.
    for (int i = 0; i < numCols; ++i) {
      colWidths.add(0);
      lines.forEach((line) {
        if (line.tokenGroups.length > i) {
          if (line.tokenGroups[i].length() > colWidths[i]) {
            colWidths[i] = line.tokenGroups[i].length();
          }
        }
      });
    }

    return colWidths;
  }

  @override
  String toString() {
    return lines.join(r'\n');
  }
}