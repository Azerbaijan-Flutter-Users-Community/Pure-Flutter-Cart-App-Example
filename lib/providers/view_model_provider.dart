import 'package:flutter/cupertino.dart';

class ViewModelProvider<T> extends InheritedWidget {
  ViewModelProvider({
    this.viewModel,
    this.child,
  }) : super(child: child);

  final T viewModel;
  final Widget child;

  static ViewModelProvider<T> of<T>(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ViewModelProvider<T>>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
