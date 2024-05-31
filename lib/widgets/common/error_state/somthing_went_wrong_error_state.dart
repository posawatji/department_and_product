import 'package:flutter/material.dart';

class SomthingWentWrongErrorState extends StatelessWidget {
  const SomthingWentWrongErrorState({
    super.key,
    required this.onRetry,
  });

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onRetry();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Something Went Wrong.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),
          ),
          const SizedBox(height: 8),
          Text(
            'Retry',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.deepPurple),
          ),
        ],
      ),
    );
  }
}
