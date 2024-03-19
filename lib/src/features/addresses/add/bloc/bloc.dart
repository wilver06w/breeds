import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breeds/src/features/addresses/add/repository.dart';
import 'package:models_breeds/app/models/data_citys.dart';
import 'package:models_breeds/app/models/data_departament.dart';

part 'event.dart';
part 'state.dart';

class BlocAddAddress extends Bloc<AddAddressEvent, AddAddressState> {
  BlocAddAddress({
    required this.repository,
  }) : super(const InitialState(Model())) {
    on<LoadDeapartamentEvent>(_onLoadDeapartamentEvent);
    on<ChangedDepartamentSelectedEvent>(_onChangedDepartamentSelectedEvent);
    on<ChangedCitySelectedEvent>(_onChangedCitySelectedEvent);
    on<LoadCityEvent>(_onLoadCityEvent);
  }
  final Repository repository;

  Future<void> _onLoadDeapartamentEvent(
    LoadDeapartamentEvent event,
    Emitter<AddAddressState> emit,
  ) async {
    try {
      emit(LoadingDepartamentState(state.model));

      final dataDepartament = await repository.getDepartaments();

      emit(
        LoadedDepartamentState(
          state.model.copyWith(
            dataDepartament: dataDepartament,
          ),
        ),
      );
    } catch (error) {
      emit(
        ErrorDepartamentState(
          model: state.model,
          message: error.toString(),
        ),
      );
    }
  }

  Future<void> _onLoadCityEvent(
    LoadCityEvent event,
    Emitter<AddAddressState> emit,
  ) async {
    try {
      emit(LoadingDepartamentState(state.model));

      final dataCitys =
          await repository.getCitys(state.model.departamentSelected?.id ?? 0);

      emit(
        LoadedDepartamentState(
          state.model.copyWith(
            dataCitys: dataCitys,
          ),
        ),
      );
    } catch (error) {
      emit(
        ErrorDepartamentState(
          model: state.model,
          message: error.toString(),
        ),
      );
    }
  }

  Future<void> _onChangedDepartamentSelectedEvent(
    ChangedDepartamentSelectedEvent event,
    Emitter<AddAddressState> emit,
  ) async {
    emit(
      ChangedDepartamentSelectedState(
        state.model.copyWith(
          departamentSelected: event.departamentSelected,
          citySelected: City(
            id: 0,
            nombre: '',
            departamentoId: 0,
          ),
        ),
      ),
    );
  }

  Future<void> _onChangedCitySelectedEvent(
    ChangedCitySelectedEvent event,
    Emitter<AddAddressState> emit,
  ) async {
    emit(ChangedCitySelectedState(
      state.model.copyWith(
        citySelected: event.citySelected,
      ),
    ));
  }
}
