part of 'bloc.dart';

abstract class DetailState extends Equatable {
  final Model model;
  const DetailState(this.model);

  @override
  List<Object?> get props => [model];
}

class InitialState extends DetailState {
  const InitialState(super.model);
}

class LoadingBannerState extends DetailState {
  const LoadingBannerState(super.model);
}

class LoadedBannerState extends DetailState {
  const LoadedBannerState(super.model);
}

class ErrorBannerState extends DetailState {
  const ErrorBannerState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class LoadingListYuGiOhByArchetypeState extends DetailState {
  const LoadingListYuGiOhByArchetypeState(super.model);
}

class LoadedDataCategoriasState extends DetailState {
  const LoadedDataCategoriasState(super.model);
}

class ErrorDataCategoriasState extends DetailState {
  const ErrorDataCategoriasState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class LoadingDataCategoriasState extends DetailState {
  const LoadingDataCategoriasState(super.model);
}

class LoadedListYuGiOhBannedState extends DetailState {
  const LoadedListYuGiOhBannedState(super.model);
}

class ErrorListYuGiOhBannedState extends DetailState {
  const ErrorListYuGiOhBannedState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class LoadingDeleteByArchetypeState extends DetailState {
  const LoadingDeleteByArchetypeState(super.model);
}

class LoadedDeleteByArchetypeState extends DetailState {
  const LoadedDeleteByArchetypeState(super.model);
}

class ErrorDeleteByArchetypeState extends DetailState {
  const ErrorDeleteByArchetypeState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class Model extends Equatable {
  const Model({
    this.id = '',
    this.dataCategoria,
    this.dataBanner,
    this.listYuGiOhBanned = const [],
  });

  final DataCategoria? dataCategoria;
  final List<int> listYuGiOhBanned;
  final List<Breed>? dataBanner;
  final String id;

  Model copyWith({
    String? id,
    DataCategoria? dataCategoria,
    List<int>? listYuGiOhBanned,
    List<Breed>? dataBanner,
  }) {
    return Model(
      id: id ?? this.id,
      dataCategoria: dataCategoria ?? this.dataCategoria,
      dataBanner: dataBanner ?? this.dataBanner,
      listYuGiOhBanned: listYuGiOhBanned ?? this.listYuGiOhBanned,
    );
  }

  List<YuGiOh> get getListYuGiOhWithoutBan => Functions.getListWithOutBan(
        listYuGiOhActually: [],
        listYuGiOhBan: listYuGiOhBanned,
      );

  @override
  List<Object?> get props {
    return [
      id,
      dataCategoria,
      dataBanner,
      listYuGiOhBanned,
    ];
  }
}
