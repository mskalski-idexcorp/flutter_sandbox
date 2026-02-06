import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sandbox/app.dart';

import 'utils/root_element_tester.dart';

void main() {
  group('App Widget', () {
    testWidgets('renders with AppBar and Container', (tester) async {
      final root = await tester.pumpAndGetRootWidget<MaterialApp>(const App());
      expect(root.home, isA<Scaffold>());

      final scaffold = root.home as Scaffold;
      expect(scaffold.appBar, isA<AppBar>());
      expect(scaffold.body, isA<Container>());
    });

    testWidgets('AppBar has correct properties', (tester) async {
      final root = await tester.pumpAndGetRootWidget<MaterialApp>(const App());

      final appBar = (root.home as Scaffold).appBar as AppBar;
      expect(appBar.backgroundColor, equals(Colors.green));
      expect(appBar.title, isA<Text>());
      expect((appBar.title as Text).data, equals('Flutter sandbox'));
    });

    testWidgets('Container has welcome text', (tester) async {
      final root = await tester.pumpAndGetRootWidget<MaterialApp>(const App());

      final container = (root.home as Scaffold).body as Container;
      expect(container.alignment, equals(Alignment.center));
      expect(container.child, isA<Text>());
      expect((container.child as Text).data, equals('Welcome to OneProTouch!'));
    });
  });
}
