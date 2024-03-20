import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breeds/src/features/home/domain/models/breed.dart';
import 'package:models_breeds/app/models/data_categoria.dart';
import 'package:models_breeds/app/models/list_yugioh.dart';
import 'package:utils_breeds/utils/functions.dart';

part 'event.dart';
part 'state.dart';

class BlocDetail extends Bloc<DetailEvent, DetailState> {
  BlocDetail() : super(const InitialState(Model())) {
    on<LoadDataCategoriasEvent>(_onLoadDataCategoriasEvent);
  }

  Future<void> _onLoadDataCategoriasEvent(
    LoadDataCategoriasEvent event,
    Emitter<DetailState> emit,
  ) async {
    try {
      emit(LoadingDataCategoriasState(state.model));

      // final dataCategoria = await repository.getCategorias();

      emit(
        LoadedDataCategoriasState(
          state.model.copyWith(
            // dataCategoria: dataCategoria,
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
