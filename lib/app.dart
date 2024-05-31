import 'package:flutter/material.dart';

import 'widgets/page/department_and_product_page/department_and_product_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light,
      home: const DepartmentAndProductPage(),
    );
  }
}
