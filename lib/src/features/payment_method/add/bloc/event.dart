part of 'bloc.dart';

abstract class PaymentAddEvent extends Equatable {
  const PaymentAddEvent();

  @override
  List<Object> get props => [];
}

class OnChangeNumberCardEvent extends PaymentAddEvent {
  const OnChangeNumberCardEvent({
    required this.number,
  });

  final String number;
}

class OnChangeHolderNameEvent extends PaymentAddEvent {
  const OnChangeHolderNameEvent({
    required this.name,
  });

  final String name;
}

class OnChangemMaaEvent extends PaymentAddEvent {
  const OnChangemMaaEvent({
    required this.mmAA,
  });

  final String mmAA;
}

class OnChangecVVEvent extends PaymentAddEvent {
  const OnChangecVVEvent({
    required this.cVV,
  });

  final String cVV;
}
