part of 'bloc.dart';

abstract class PaymentAddState extends Equatable {
  final Model model;
  const PaymentAddState(this.model);

  @override
  List<Object?> get props => [model];
}

class InitialState extends PaymentAddState {
  const InitialState(Model model) : super(model);
}

class ChangedNumberCardState extends PaymentAddState {
  const ChangedNumberCardState(Model model) : super(model);
}

class ChangedNameCardState extends PaymentAddState {
  const ChangedNameCardState(Model model) : super(model);
}

class ChangedmMmAACardState extends PaymentAddState {
  const ChangedmMmAACardState(Model model) : super(model);
}

class ErrorListYuGiOhBannedState extends PaymentAddState {
  const ErrorListYuGiOhBannedState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class LoadingDeleteByArchetypeState extends PaymentAddState {
  const LoadingDeleteByArchetypeState(Model model) : super(model);
}

class LoadedDeleteByArchetypeState extends PaymentAddState {
  const LoadedDeleteByArchetypeState(Model model) : super(model);
}

class ErrorDeleteByArchetypeState extends PaymentAddState {
  const ErrorDeleteByArchetypeState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class Model extends Equatable {
  const Model({
    this.numberCard = '',
    this.name = '',
    this.mmAA = '',
    this.cVV = '',
  });

  final String numberCard;
  final String name;
  final String mmAA;
  final String cVV;

  Model copyWith({
    String? numberCard,
    String? name,
    String? mmAA,
    String? cVV,
  }) {
    return Model(
      numberCard: numberCard ?? this.numberCard,
      name: name ?? this.name,
      mmAA: mmAA ?? this.mmAA,
      cVV: cVV ?? this.cVV,
    );
  }

  bool get isFormFilled =>
      numberCard.isNotEmpty &&
      name.isNotEmpty &&
      mmAA.isNotEmpty &&
      cVV.isNotEmpty;

  String get imageIcSelected => ProTiendasUiValues.icVisa;

  @override
  List<Object?> get props {
    return [
      numberCard,
      name,
      mmAA,
      cVV,
    ];
  }
}
