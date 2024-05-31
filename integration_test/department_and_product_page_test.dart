import 'package:department_and_product/widgets/common/dialogs/product_detail_dialog.dart';
import 'package:department_and_product/widgets/page/department_and_product_page/department_and_product_page_department_card_carousel_list.dart';
import 'package:department_and_product/widgets/page/department_and_product_page/department_and_product_page_department_product_card_gridview_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers.dart';

void main() {
  testWidgets('department and product page flow', (WidgetTester tester) async {
    await startApp(tester);

    final departmentCarouselListFinder = find.byKey(DepartmentAndProductPageDepartmentCardCarouselList.keys.department_carousel_list);
    final productListFinder = find.byKey(DepartmentAndProductPageDepartmentProductCardGridviewList.keys.product_list);

    // case 200 tap department card to show product list.
    //
    expect(departmentCarouselListFinder, findsOneWidget);
    await tester.pumpAndSettle();

    await tester.dragUntilVisible(find.text('Industrial'), find.byType(ListView), const Offset(-50, 0));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Industrial'));
    await tester.pumpAndSettle();

    expect(find.text('Product list : Industrial'), findsOneWidget);
    await tester.pumpAndSettle();

    expect(productListFinder, findsOneWidget);
    await tester.pumpAndSettle();

    // case tap product card to show product detail dialog.
    //
    await tester.dragUntilVisible(find.text('Intelligent Granite Pizza'), find.byType(CustomScrollView), const Offset(0, -50));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Intelligent Granite Pizza'));
    await tester.pumpAndSettle();

    expect(find.byKey(ProductDetailDialog.keys.product_detail_dialog), findsOneWidget);
    expect(find.byKey(ProductDetailDialog.keys.product_description), findsOneWidget);
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(ProductDetailDialog.keys.close_button));
    await tester.pumpAndSettle();

    expect(find.byKey(ProductDetailDialog.keys.product_detail_dialog), findsNothing);
    await tester.pumpAndSettle();

    // case product list show state code 404.
    //
    await tester.dragUntilVisible(departmentCarouselListFinder, find.byType(CustomScrollView), const Offset(0, 50));
    await tester.pumpAndSettle();

    await tester.dragUntilVisible(find.text('Books'), find.byType(ListView), const Offset(-50, 0));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Books'));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Product list : Books'), findsOneWidget);
    expect(find.text('API Error Status Code: 404'), findsOneWidget);
    await tester.pumpAndSettle();
  });
}
