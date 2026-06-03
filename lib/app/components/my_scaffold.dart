import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_list/app/modules/shop_list/presenter/widgets/bottom_sheet_form.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 80),
        child: AppBar(
          titleTextStyle: Theme.of(context).textTheme.titleMedium,
          title: Column(
            // spacing: 4.0,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 8),
              Text(
                'Shopping List',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Organize, economize e compre melhor',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          actions: [
            // IconButton(
            //   onPressed: () {
            //     ThemeController.to.toggleTheme();
            //   },
            //   icon: Icon(Icons.dark_mode),
            // ),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Padding(padding: const EdgeInsets.all(20.0), child: child),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SafeArea(
        child: SizedBox(
          height: 60,
          child: ElevatedButton.icon(
            onPressed: () {
              Get.bottomSheet(BottomSheetForm());
            },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.primary,
              ),
            ),
            icon: Icon(Icons.add, color: Theme.of(context).iconTheme.color),
            label: Text(
              'Nova Lista',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ),
      ),
    );
  }
}
