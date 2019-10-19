import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseChangeNotifier<T extends ChangeNotifier> extends StatefulWidget {
  BaseChangeNotifier({
    Key key,
    this.model,
    this.builder,
    this.child,
    this.onModelReady,
  }) : super(key: key);

  final Widget Function(BuildContext context, T value, Widget child) builder;
  final T model;
  final Widget child;
  final Function(T) onModelReady;
  @override
  _BaseChangeNotifierState createState() => _BaseChangeNotifierState<T>();
}

class _BaseChangeNotifierState<T extends ChangeNotifier>
    extends State<BaseChangeNotifier<T>> {
  T model;

  @override
  void initState() {
    // assign the model once when state is initialised
    model = widget.model;

    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
