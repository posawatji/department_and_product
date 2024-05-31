import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../config/env.dart';
import '../../model/product_model/product_model.dart';
import '../../provider/api_client_provider.dart';

final getProductListByDepartmentIdProvider = FutureProvider.autoDispose.family<List<ProductModel>, String>((ref, departmentId) async {
  final cancelToken = CancelToken();

  ref.onDispose(() {
    cancelToken.cancel();
  });

  final response = await ref.watch(apiClientProvider).get('${ENV.DEPARTMENT_SERVICE}/$departmentId/products', cancelToken: cancelToken);

  if (response.statusCode == 204) return [];

  final list = response.data as List;
  return list.map((e) => ProductModel.fromJson(e)).toList();
});
