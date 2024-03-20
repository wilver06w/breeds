import 'package:breeds/src/features/detail/domain/usecases/breed_usecase.dart';
import 'package:breeds/src/features/detail/presentation/bloc/bloc.dart';
import 'package:breeds/src/shared/widget/favorite/bloc/bloc.dart';
import 'package:breeds_widget/app/widget/app_bar_global.dart';
import 'package:breeds_widget/app/widget/item_description.dart';
import 'package:breeds_widget/app/widget/star_item.dart';
import 'package:breeds_widget/app/widget/title_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:l10n_breeds/app/breeds_ui.dart';
import 'package:network_breeds/app/network/http_client.dart'
    hide ModularWatchExtension;
import 'package:oktoast/oktoast.dart';
import 'package:utils_breeds/utils/constant/colors.dart';
import 'package:utils_breeds/utils/constant/navigation.dart';
import 'package:utils_breeds/utils/constant/responsive.dart';
import 'package:utils_breeds/utils/constant/spacing.dart';
import 'package:utils_breeds/utils/functions.dart';
import 'package:utils_breeds/utils/helpers/text/xigo_text.dart';
import 'package:utils_breeds/utils/loading.dart';

part 'package:breeds/src/features/detail/presentation/_sections/body.dart';

class Page extends StatelessWidget {
  const Page({
    super.key,
    required this.detailParams,
  });

  final DetailParams detailParams;

  @override
  Widget build(BuildContext context) {
    final getBreedUseCase = Modular.get<GetBreedUseCase>();
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlocDetail>(
          create: (context) => BlocDetail(
            getBreedUseCase: getBreedUseCase,
          )..add(
              LoadBreedDetailEvent(idBreeds: detailParams.id),
            ),
        ),
        BlocProvider.value(
          value: Modular.get<BlocFavorite>(),
        ),
      ],
      child: BlocListener<BlocDetail, DetailState>(
        listener: _listener,
        child: Scaffold(
          backgroundColor: ProTiendasUiColors.white,
          appBar: AppBarGlobal(
            title: detailParams.name,
            haveSearch: false,
            havHeart: true,
            havCart: false,
            widgetHeart: BlocBuilder<BlocFavorite, FavoriteState>(
              builder: (context, state) {
                final isFavorite =
                    state.model.favorites.contains(detailParams.breed);
                return Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (detailParams.breed != null) {
                          context.read<BlocFavorite>().add(
                              OnChangeFavoriteEvent(id: detailParams.breed!));
                        }
                      },
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: ProTiendasUiColors.secondaryColor,
                      ),
                    ),
                    const Gap(BreedSpacing.md),
                  ],
                );
              },
            ),
            onTapIcon: () {
              Modular.to.pop();
            },
          ),
          body: SafeArea(
            child: Body(
              detailParams: detailParams,
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _listener(BuildContext context, DetailState state) async {
  if (state is LoadingBreedState) {
    BreedLoading.show(context);
  } else if (state is ErrorBreedState) {
    Navigator.pop(context);
    showToast(
      state.message,
      backgroundColor: ProTiendasUiColors.rybBlue,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
    );
  } else if (state is LoadedBreedState) {
    Navigator.pop(context);
  }
}
