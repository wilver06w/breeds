import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breeds/src/features/dashbo/home/domain/models/data_banner.dart';
import 'package:breeds/src/features/dashbo/home/domain/usecases/banlist_usecase.dart';
import 'package:breeds/src/features/dashbo/home/domain/usecases/banner_usecase.dart';
import 'package:breeds/src/features/dashbo/home/domain/usecases/categorias_usecase.dart';
import 'package:breeds/src/features/dashbo/repository.dart';
import 'package:models_breeds/app/models/data_categoria.dart';

part 'event.dart';
part 'state.dart';

class BlocHome extends Bloc<HomeEvent, HomeState> {
  BlocHome({
    required this.repository,
    required this.listBanUseCase,
    required this.bannerUseCase,
    required this.categoriesUseCase,
  }) : super(const InitialState(Model())) {
    on<LoadBannerEvent>(_onLoadBannerEvent);
    on<LoadDataCategoriasEvent>(_onLoadDataCategoriasEvent);
  }
  final Repository repository;
  final ListBanUseCase listBanUseCase;
  final BannerUseCase bannerUseCase;
  final CategoriesUseCase categoriesUseCase;

  Future<void> _onLoadBannerEvent(
    LoadBannerEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(LoadingBannerState(state.model));

    final dataBanner = await bannerUseCase.call();

    dataBanner.fold((l) {
      emit(
        ErrorBannerState(
          model: state.model,
          message: l.errorMessage,
        ),
      );
    }, (r) {
      emit(
        LoadedBannerState(
          state.model.copyWith(
            dataBanner: r,
          ),
        ),
      );
    });
  }

  Future<void> _onLoadDataCategoriasEvent(
    LoadDataCategoriasEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(LoadingDataCategoriasState(state.model));

    final dataCategoria = await categoriesUseCase.call();

    dataCategoria.fold((l) {
      emit(
        ErrorDataCategoriasState(
          model: state.model,
          message: l.toString(),
        ),
      );
    }, (r) {
      emit(
        LoadedDataCategoriasState(
          state.model.copyWith(
            dataCategoria: r,
          ),
        ),
      );
    });
  }
}
