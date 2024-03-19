part of 'bloc.dart';

abstract class DetailState extends Equatable {
  final Model model;
  const DetailState(this.model);

  @override
  List<Object?> get props => [model];
}

class InitialState extends DetailState {
  const InitialState(Model model) : super(model);
}

class LoadingBannerState extends DetailState {
  const LoadingBannerState(Model model) : super(model);
}

class LoadedBannerState extends DetailState {
  const LoadedBannerState(Model model) : super(model);
}

class ErrorBannerState extends DetailState {
  const ErrorBannerState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class LoadingListYuGiOhByArchetypeState extends DetailState {
  const LoadingListYuGiOhByArchetypeState(Model model) : super(model);
}

class LoadedDataCategoriasState extends DetailState {
  const LoadedDataCategoriasState(Model model) : super(model);
}

class ErrorDataCategoriasState extends DetailState {
  const ErrorDataCategoriasState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class LoadingDataCategoriasState extends DetailState {
  const LoadingDataCategoriasState(Model model) : super(model);
}

class LoadedListYuGiOhBannedState extends DetailState {
  const LoadedListYuGiOhBannedState(Model model) : super(model);
}

class ErrorListYuGiOhBannedState extends DetailState {
  const ErrorListYuGiOhBannedState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class LoadingDeleteByArchetypeState extends DetailState {
  const LoadingDeleteByArchetypeState(Model model) : super(model);
}

class LoadedDeleteByArchetypeState extends DetailState {
  const LoadedDeleteByArchetypeState(Model model) : super(model);
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
    this.dataCategoria,
    this.dataBanner,
    this.listYuGiOhBanned = const [],
  });

  final DataCategoria? dataCategoria;
  final List<int> listYuGiOhBanned;
  final DataBanner? dataBanner;

  Model copyWith({
    DataCategoria? dataCategoria,
    List<int>? listYuGiOhBanned,
    DataBanner? dataBanner,
  }) {
    return Model(
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
      dataCategoria,
      dataBanner,
      listYuGiOhBanned,
    ];
  }
}
