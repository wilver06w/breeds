part of 'bloc.dart';

abstract class HomeState extends Equatable {
  final Model model;
  const HomeState(this.model);

  @override
  List<Object?> get props => [model];
}

class InitialState extends HomeState {
  const InitialState(Model model) : super(model);
}

class LoadingBannerState extends HomeState {
  const LoadingBannerState(Model model) : super(model);
}

class LoadedBannerState extends HomeState {
  const LoadedBannerState(Model model) : super(model);
}

class ErrorBannerState extends HomeState {
  const ErrorBannerState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class LoadingListYuGiOhByArchetypeState extends HomeState {
  const LoadingListYuGiOhByArchetypeState(Model model) : super(model);
}

class LoadedDataCategoriasState extends HomeState {
  const LoadedDataCategoriasState(Model model) : super(model);
}

class ErrorDataCategoriasState extends HomeState {
  const ErrorDataCategoriasState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class LoadingDataCategoriasState extends HomeState {
  const LoadingDataCategoriasState(Model model) : super(model);
}

class LoadedListYuGiOhBannedState extends HomeState {
  const LoadedListYuGiOhBannedState(Model model) : super(model);
}

class ErrorListYuGiOhBannedState extends HomeState {
  const ErrorListYuGiOhBannedState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class LoadingDeleteByArchetypeState extends HomeState {
  const LoadingDeleteByArchetypeState(Model model) : super(model);
}

class LoadedDeleteByArchetypeState extends HomeState {
  const LoadedDeleteByArchetypeState(Model model) : super(model);
}

class ErrorDeleteByArchetypeState extends HomeState {
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
    this.banList,
  });

  final DataCategoria? dataCategoria;
  final DataBanner? dataBanner;
  final List<int>? banList;

  Model copyWith({
    DataCategoria? dataCategoria,
    DataBanner? dataBanner,
    List<int>? banList,
  }) {
    return Model(
      dataCategoria: dataCategoria ?? this.dataCategoria,
      dataBanner: dataBanner ?? this.dataBanner,
      banList: banList ?? this.banList,
    );
  }

  @override
  List<Object?> get props {
    return [
      dataCategoria,
      dataBanner,
      banList,
    ];
  }
}
