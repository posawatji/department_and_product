import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiStatusCodeErrorState extends StatelessWidget {
  const ApiStatusCodeErrorState({
    super.key,
    required this.error,
  });

  final DioException error;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_outline,
          size: 60,
          color: Colors.black,
        ),
        const SizedBox(height: 8),
        Text(
          'API Error Status Code: ${error.response?.statusCode.toString() ?? ''}',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
