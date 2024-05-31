import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/department_api/get_product_list_by_department_id.dart';
import '../../common/dialogs/product_detail_dialog.dart';
import '../../common/error_state/api_status_code_error_state.dart';
import '../../common/error_state/somthing_went_wrong_error_state.dart';
import 'department_and_product_page.state.dart';
import 'department_and_product_page_department_product_card.dart';

class DepartmentAndProductPageDepartmentProductCardGridviewList extends HookConsumerWidget {
  const DepartmentAndProductPageDepartmentProductCardGridviewList({super.key});

  static const keys = (product_list: Key('department_and_product_page_department_product_card_gridview_list'),);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = DepartmentAndProductPageState.of(context);

    return ref.watch(getProductListByDepartmentIdProvider(state.departmentSelected.value.id)).when(
          skipLoadingOnRefresh: false,
          data: (productList) {
            return SliverPadding(
              key: keys.product_list,
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 230,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final product = productList[index];

                    return GestureDetector(
                      onTap: () {
                        ProductDetailDialog.show(
                          context,
                          productDescription: product.desc,
                        );
                      },
                      child: DepartmentAndProductPageDepartmentProductCard(product: product),
                    );
                  },
                  childCount: productList.length,
                ),
              ),
            );
          },
          error: (error, stackTrace) {
            if (error is DioException) {
              return SliverFillRemaining(
                hasScrollBody: false,
                child: ApiStatusCodeErrorState(
                  error: error,
                ),
              );
            }

            return SliverFillRemaining(
              hasScrollBody: false,
              child: SomthingWentWrongErrorState(
                onRetry: () {
                  ref.invalidate(getProductListByDepartmentIdProvider(state.departmentSelected.value.id));
                },
              ),
            );
          },
          loading: () {
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        );
  }
}
