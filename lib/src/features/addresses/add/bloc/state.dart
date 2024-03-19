part of 'bloc.dart';

abstract class AddAddressState extends Equatable {
  final Model model;
  const AddAddressState(this.model);

  @override
  List<Object?> get props => [model];
}

class InitialState extends AddAddressState {
  const InitialState(Model model) : super(model);
}

class LoadingDepartamentState extends AddAddressState {
  const LoadingDepartamentState(Model model) : super(model);
}

class LoadedDepartamentState extends AddAddressState {
  const LoadedDepartamentState(Model model) : super(model);
}

class ErrorDepartamentState extends AddAddressState {
  const ErrorDepartamentState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class ChangedDepartamentSelectedState extends AddAddressState {
  const ChangedDepartamentSelectedState(Model model) : super(model);
}

class ChangedCitySelectedState extends AddAddressState {
  const ChangedCitySelectedState(Model model) : super(model);
}

class Model extends Equatable {
  const Model({
    this.dataDepartament,
    this.departamentSelected,
    this.dataCitys,
    this.citySelected,
  });

  final DataDepartament? dataDepartament;
  final DataCitys? dataCitys;
  final Datum? departamentSelected;
  final City? citySelected;

  Model copyWith({
    DataDepartament? dataDepartament,
    Datum? departamentSelected,
    DataCitys? dataCitys,
    City? citySelected,
  }) {
    return Model(
      dataDepartament: dataDepartament ?? this.dataDepartament,
      departamentSelected: departamentSelected ?? this.departamentSelected,
      dataCitys: dataCitys ?? this.dataCitys,
      citySelected: citySelected ?? this.citySelected,
    );
  }

  // List<Archetype> get getListArchetypeFilter => [];

  // List<YuGiOh> get getListYuGiOhWithoutBan => Functions.getListWithOutBan(
  //       listYuGiOhActually: [],
  //       listYuGiOhBan: listYuGiOhBanned,
  //     );

  @override
  List<Object?> get props {
    return [
      dataDepartament,
      departamentSelected,
      dataCitys,
      citySelected,
    ];
  }
}
