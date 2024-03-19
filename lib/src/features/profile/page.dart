import 'package:breeds_widget/app/widget/app_bar_global.dart';
import 'package:flutter/material.dart';
import 'package:breeds/src/core/utils/constant/protienda_ui.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGlobal(
        onTapIcon: () {},
        haveSearch: false,
        title: ProTiendasUiValues.myProfile,
        havCart: false,
      ),
      body: Center(
        child: Text(
          ProTiendasUiValues.myProfile,
        ),
      ),
    );
  }
}
