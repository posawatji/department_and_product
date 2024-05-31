import 'package:flutter/material.dart';

import '../../../model/department_model/department_model.dart';

class DepartmentAndProductPageState extends InheritedWidget {
  const DepartmentAndProductPageState({
    super.key,
    required super.child,
    required this.departmentSelected,
  });

  final ValueNotifier<DepartmentModel> departmentSelected;

  static DepartmentAndProductPageState? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DepartmentAndProductPageState>();
  }

  static DepartmentAndProductPageState of(BuildContext context) {
    final DepartmentAndProductPageState? result = maybeOf(context);
    assert(result != null, 'No DepartmentAndProductPageState found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
