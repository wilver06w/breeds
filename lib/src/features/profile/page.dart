import 'package:breeds_widget/app/widget/app_bar_global.dart';
import 'package:flutter/material.dart';
import 'package:l10n_breeds/app/breeds_ui.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGlobal(
        onTapIcon: () {},
        haveSearch: false,
        title: BreedUiValues.myProfile,
        havCart: false,
      ),
      body: Center(
        child: Text(
          BreedUiValues.myProfile,
        ),
      ),
    );
  }
}
