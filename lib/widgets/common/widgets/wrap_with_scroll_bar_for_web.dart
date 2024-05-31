import 'package:flutter/material.dart';

class WrapWithScrollBarForWeb extends StatelessWidget {
  const WrapWithScrollBarForWeb({
    super.key,
    required this.scrollController,
    required this.child,
    required this.isWrap,
  });

  final ScrollController scrollController;
  final Widget child;
  final bool isWrap;

  @override
  Widget build(BuildContext context) {
    if (!isWrap) return child;

    return Scrollbar(
      controller: scrollController,
      child: child,
    );
  }
}
