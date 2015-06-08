import 'line.dart';

class LineGroup {
  final List<Line> lines;

  LineGroup(this.lines) {

  }

  List<int> measureColWidths() {
    int numCols = 0;
    var colWidths = new List<int>();
    lines.forEach((line) {
      if (line.tokenGroups.length > numCols) {
        numCols = line.tokenGroups.length;
      }
    });

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
    return '{"colWidths":[' + measureColWidths().join(', ') + '], "lines":' +
        lines.join(', ') + '}';
  }
}