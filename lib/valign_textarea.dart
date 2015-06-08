// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

//import 'package:paper_elements/paper_autogrow_textarea.dart';
import 'package:polymer/polymer.dart';

import 'token.dart';
import 'line.dart';
import 'line_group.dart';
import 'token_group.dart';
import 'aligned_doc.dart';

/// A Polymer `<main-app>` element.
@CustomTag('valign-textarea')
class ValignTextarea extends PolymerElement {
  //
  // element -> text (with html?) -> lines/tokens -> aligned text -> aligned html
  //
  @observable String encoded = '';
//  @observable String ascii = '';
//  @observable String kidNodes = '';
//  @observable String lines = '';

  /// Constructor used to create instance of MainApp.
  ValignTextarea.created() : super.created();

  void valign(Event event, Object object, DivElement target) {
    var output = $['output'];
    var textLines = getTextLines(target);

    var lines = new List<Line>();
    var lineGroups = new List<LineGroup>();
    lineGroups.add(new LineGroup(lines));

    textLines.forEach((textLine) {
      if (textLine.isEmpty && lines.isNotEmpty) {
        lines = new List<Line>();
        lineGroups.add(new LineGroup(lines));
      } else {
        var tokens = Token.parseType(textLine, Token.TEXT);
        lines.add(new Line(textLine, TokenGroup.wrapTokens(tokens)));
      }
    });

    var doc = new AlignedDoc(lineGroups);

    output.setInnerHtml(textLines.join('<br>'));
    encoded = doc.toString();
  }

  List<String> getTextLines(Element el) {
    var lines = el.innerHtml.trim().split('<br>');
    if (lines.last.trim() == '<br>') {
      lines.removeLast();
    }
    var div = new DivElement();
    for (int i = 0; i < lines.length; ++i) {
      div.setInnerHtml(lines[i]);
      lines[i] = div.text.replaceAll('&nbsp;', ' ').trim();
    }
    return lines;
  }

  // Optional lifecycle methods - uncomment if needed.

  /// Called when an instance of main-app is inserted into the DOM.
  attached() {
    super.attached();
//    output = querySelector('#output');
//    textarea = querySelector('#text');
  }

//  /// Called when an instance of main-app is removed from the DOM.
//  detached() {
//    super.detached();
//  }

//  /// Called when an attribute (such as a class) of an instance of
//  /// main-app is added, changed, or removed.
//  attributeChanged(String name, String oldValue, String newValue) {
//    super.attributeChanges(name, oldValue, newValue);
//  }

//  /// Called when main-app has been fully prepared (Shadow DOM created,
//  /// property observers set up, event listeners attached).
//  ready() {
//    super.ready();
//  }
}
