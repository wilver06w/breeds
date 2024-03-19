import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breeds/src/features/dashbo/home/domain/models/data_banner.dart';
import 'package:breeds/src/features/detail/repository.dart';
import 'package:models_breeds/app/models/data_categoria.dart';
import 'package:models_breeds/app/models/list_yugioh.dart';
import 'package:utils_breeds/utils/functions.dart';

part 'event.dart';
part 'state.dart';

class BlocDetail extends Bloc<DetailEvent, DetailState> {
  BlocDetail({
    required this.repository,
  }) : super(const InitialState(Model())) {
    on<LoadDataCategoriasEvent>(_onLoadDataCategoriasEvent);
  }
  final Repository repository;

  Future<void> _onLoadDataCategoriasEvent(
    LoadDataCategoriasEvent event,
    Emitter<DetailState> emit,
  ) async {
    try {
      emit(LoadingDataCategoriasState(state.model));

      final dataCategoria = await repository.getCategorias();

      emit(
        LoadedDataCategoriasState(
          state.model.copyWith(
            dataCategoria: dataCategoria,
          ),
        ),
      );
    } catch (error) {
      emit(
        ErrorDataCategoriasState(
          model: state.model,
          message: error.toString(),
        ),
      );
    }
  }
}
