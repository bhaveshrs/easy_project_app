part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LogIn extends AuthEvent {
  final String? email;
  final String? pass;
  const LogIn({
    this.email,
    this.pass,
  });
}
