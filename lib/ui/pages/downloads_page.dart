import 'package:ecommerce/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DownloadsPage extends ConsumerStatefulWidget {
  const DownloadsPage({Key? key}) : super(key: key);
  static const routeName = '/downloads-page';

  @override
  _DownloadsPageState createState() => _DownloadsPageState();
}

class _DownloadsPageState extends ConsumerState<DownloadsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Downloads',
        goBack: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider(height: 1, color: Colors.grey);
                },
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    title: Text('Donwload $index'),
                    trailing: const Icon(
                      Icons.arrow_circle_down,
                      color: Colors.deepOrange,
                    ),
                  );
                },
                shrinkWrap: true,
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
