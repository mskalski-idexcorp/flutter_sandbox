import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension RootElementTester on WidgetTester {
  Future<T> pumpAndGetRootWidget<T>(Widget widget) async {
    final rootElement = await _pumpAndGetRootElement(widget);
    final children = <Element>[];
    rootElement.visitChildren(children.add);
    expect(children, hasLength(1));
    Widget root = children.single.widget;
    expect(root, isA<T>());
    return root as T;
  }

  Future<Element> _pumpAndGetRootElement(Widget widget) async {
    await pumpWidget(widget);

    final rootElement = allElements.firstWhere(
      (e) => identical(e.widget, widget),
      orElse: () {
        throw StateError(
          'Could not find root element for pumped widget $widget',
        );
      },
    );

    return rootElement;
  }
}
