import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const ProductModel._();

  const factory ProductModel({
    @Default('') String name,
    @Default('') String imageUrl,
    @Default('') String desc,
    @Default('') String price,
    @Default('') String type,
    @Default('') String id,
    @Default('') String departmentId,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, Object?> json) => _$ProductModelFromJson(json);
}
