import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductDetailDialog extends HookConsumerWidget {
  const ProductDetailDialog({
    super.key,
    required this.productDescription,
  });

  final String productDescription;

  static String get name => 'product_detail_dialog';

  static Future<void> show(
    BuildContext context, {
    required String productDescription,
    bool canDismiss = false,
  }) async {
    await showDialog(
      barrierDismissible: canDismiss,
      context: context,
      routeSettings: RouteSettings(name: name),
      builder: (context) {
        return ProductDetailDialog(
          key: keys.product_detail_dialog,
          productDescription: productDescription,
        );
      },
    );
  }

  static void close(BuildContext context) {
    Navigator.of(context).pop();
  }

  static const keys = (
    product_detail_dialog: Key('department_and_product_page_department_product_card_gridview_list_product_detail_dialog'),
    product_description: Key('product_detail_dialog_product_description'),
    close_button: Key('product_detail_dialog_close_button'),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    return Dialog(
      elevation: 0,
      insetPadding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black, width: 1),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Text(
                'Product Description',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black),
              ),
            ),
            Expanded(
              child: Scrollbar(
                controller: scrollController,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        Text(
                          key: keys.product_description,
                          productDescription,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Divider(color: Colors.black, height: 1),
            GestureDetector(
              key: keys.close_button,
              behavior: HitTestBehavior.opaque,
              onTap: () {
                close(context);
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                child: Text(
                  'Close',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
