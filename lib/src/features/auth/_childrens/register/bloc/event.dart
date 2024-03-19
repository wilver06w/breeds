part of 'bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class ChangeEmailEvent extends RegisterEvent {
  const ChangeEmailEvent({
    required this.email,
  });

  final String email;
}

class ChangeNameEvent extends RegisterEvent {
  const ChangeNameEvent({
    required this.name,
  });

  final String name;
}

class ChangeNumberPhone extends RegisterEvent {
  const ChangeNumberPhone({
    required this.numberPhone,
  });

  final String numberPhone;
}

class ChangePasswordEvent extends RegisterEvent {
  const ChangePasswordEvent({
    required this.password,
  });

  final String password;
}

class SendRegisterEvent extends RegisterEvent {}
