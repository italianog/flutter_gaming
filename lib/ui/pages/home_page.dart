import 'package:eccomerce/providers/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomePage extends ConsumerWidget {
  static const routeName = '/home-page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(mainProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ecommerce App'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Text(
          value,
          style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 48,
              letterSpacing: 1.25,
              color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
