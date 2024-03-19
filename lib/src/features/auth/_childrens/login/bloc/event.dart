part of 'bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class ChangeEmailEvent extends LoginEvent {
  const ChangeEmailEvent({
    required this.email,
  });

  final String email;
}

class ChangePasswordEvent extends LoginEvent {
  const ChangePasswordEvent({
    required this.password,
  });

  final String password;
}

class SendLoginEvent extends LoginEvent {}
