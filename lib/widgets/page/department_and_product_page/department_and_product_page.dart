import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/department_api/get_departments_carousel_list.dart';
import '../../../api/department_api/get_product_list_by_department_id.dart';
import '../../../model/department_model/department_model.dart';
import '../../common/error_state/api_status_code_error_state.dart';
import '../../common/error_state/somthing_went_wrong_error_state.dart';
import 'department_and_product_page.state.dart';
import 'department_and_product_page_department_card_carousel_list.dart';
import 'department_and_product_page_department_product_card_gridview_list.dart';

class DepartmentAndProductPage extends HookConsumerWidget {
  const DepartmentAndProductPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final departmentSelected = useState<DepartmentModel>(DepartmentModel.fromJson({}));

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        if (context.mounted) {
          final departmentsCarouselList = await ref.read(getDepartmentsCarouselListProvider.future);
          departmentSelected.value = departmentsCarouselList.first;
        }
      });
      return null;
    }, []);

    return DepartmentAndProductPageState(
      departmentSelected: departmentSelected,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(getDepartmentsCarouselListProvider);
                ref.invalidate(getProductListByDepartmentIdProvider);
              },
              child: CustomScrollView(
                slivers: [
                  ref.watch(getDepartmentsCarouselListProvider).when(
                        skipLoadingOnRefresh: false,
                        data: (departmentCarouselList) {
                          return SliverMainAxisGroup(
                            slivers: [
                              SliverToBoxAdapter(
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(8, 24, 8, 8),
                                  child: Text(
                                    'Department Carousel',
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black),
                                  ),
                                ),
                              ),
                              DepartmentAndProductPageDepartmentCardCarouselList(
                                departmentCarouselList: departmentCarouselList,
                              ),
                              SliverToBoxAdapter(
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(8, 16, 8, 0),
                                  child: Text(
                                    'Product list : ${departmentSelected.value.name}',
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black),
                                  ),
                                ),
                              ),
                              const DepartmentAndProductPageDepartmentProductCardGridviewList(),
                            ],
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
                                ref.invalidate(getDepartmentsCarouselListProvider);
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
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
