import 'package:freezed_annotation/freezed_annotation.dart';

part 'department_model.freezed.dart';
part 'department_model.g.dart';

@freezed
class DepartmentModel with _$DepartmentModel {
  const DepartmentModel._();

  const factory DepartmentModel({
    @Default('') String name,
    @Default('') String imageUrl,
    @Default('') String id,
  }) = _DepartmentModel;

  factory DepartmentModel.fromJson(Map<String, Object?> json) => _$DepartmentModelFromJson(json);
}
