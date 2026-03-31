import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_list/app/modules/shop_list/presenter/widgets/bottom_sheet_form.dart';
import 'package:shop_list/app/theme/theme_controller.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 80),
        child: AppBar(
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Shopping List'),
              Text(
                'Organize, economize e compre melhor',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.blue,
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
      floatingActionButton: SizedBox(
        height: 60,
        child: ElevatedButton.icon(
          onPressed: () {
            Get.bottomSheet(BottomSheetForm());
          },
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.blue),
          ),
          icon: Icon(Icons.add, color: Colors.white),
          label: Text(
            'Nova Lista',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
