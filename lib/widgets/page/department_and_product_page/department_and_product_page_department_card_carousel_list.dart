import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../model/department_model/department_model.dart';
import '../../common/widgets/wrap_with_scroll_bar_for_web.dart';
import 'department_and_product_page.state.dart';
import 'department_and_product_page_department_card.dart';

class DepartmentAndProductPageDepartmentCardCarouselList extends HookWidget {
  const DepartmentAndProductPageDepartmentCardCarouselList({
    super.key,
    required this.departmentCarouselList,
  });

  final List<DepartmentModel> departmentCarouselList;

  static const keys = (department_carousel_list: Key('department_and_product_page_department_carousel_list'),);

  @override
  Widget build(BuildContext context) {
    final state = DepartmentAndProductPageState.of(context);

    final scrollController = useScrollController();

    return SliverToBoxAdapter(
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        alignment: Alignment.center,
        height: kIsWeb ? 106 : 90,
        child: WrapWithScrollBarForWeb(
          scrollController: scrollController,
          isWrap: kIsWeb ? true : false,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: 90,
            margin: const EdgeInsets.fromLTRB(0, 0, 0, kIsWeb ? 16 : 0),
            alignment: Alignment.topLeft,
            child: ListView.builder(
              key: keys.department_carousel_list,
              controller: scrollController,
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              scrollDirection: Axis.horizontal,
              itemCount: departmentCarouselList.length,
              itemBuilder: (context, index) {
                final department = departmentCarouselList[index];

                return Container(
                  margin: EdgeInsets.fromLTRB(0, 0, index == departmentCarouselList.length - 1 ? 0 : 8, 0),
                  child: GestureDetector(
                    onTap: () {
                      state.departmentSelected.value = department;
                    },
                    child: DepartmentAndProductPageDepartmentCard(department: department),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
