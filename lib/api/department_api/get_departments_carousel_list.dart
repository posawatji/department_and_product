import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../config/env.dart';
import '../../model/department_model/department_model.dart';
import '../../provider/api_client_provider.dart';

final getDepartmentsCarouselListProvider = FutureProvider.autoDispose<List<DepartmentModel>>((ref) async {
  final cancelToken = CancelToken();

  ref.onDispose(() {
    cancelToken.cancel();
  });

  final response = await ref.watch(apiClientProvider).get(ENV.DEPARTMENT_SERVICE, cancelToken: cancelToken);

  if (response.statusCode == 204) return [];

  final list = response.data as List;
  return list.map((e) => DepartmentModel.fromJson(e)).toList();
});
