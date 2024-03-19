import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:breeds/src/core/utils/helpers/text/text.dart';
import 'package:breeds/src/features/dashbo/home/presentation/page.dart' as home;
import 'package:breeds/src/features/notifications/page.dart' as notifications;
import 'package:breeds/src/features/favorites/page.dart' as favorites;
import 'package:breeds/src/features/profile/page.dart' as profile;
import 'package:breeds/src/core/utils/constant/colors.dart';
import 'package:breeds/src/core/utils/constant/protienda_ui.dart';
import 'package:breeds/src/core/utils/constant/spacing.dart';
import 'package:breeds/src/features/dashbo/dashboard/presentation/bloc/bloc.dart';

part 'package:breeds/src/features/dashbo/dashboard/presentation/_sections/body.dart';
part 'package:breeds/src/features/dashbo/dashboard/presentation/_sections/item_dashboard.dart';
part 'package:breeds/src/features/dashbo/dashboard/presentation/_sections/bottom_navigator.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: Modular.get<BlocDashboard>(),
      child: Scaffold(
        bottomNavigationBar: const BottomNavigator(),
        body: PopScope(
          canPop: false,
          onPopInvoked: (didPop) async {
            if (Modular.get<BlocDashboard>().state.model.position == 0) {
              SystemNavigator.pop();
              return;
            }
            Modular.get<BlocDashboard>()
                .add(const ChangePositionEvent(position: 0));
          },
          child: const Body(),
        ),
      ),
    );
  }
}
