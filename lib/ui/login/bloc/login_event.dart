part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginSubmitted extends LoginEvent{
  final String phoneNumber;
  final String password;

  @override
  List<Object?> get props =>[];

  const LoginSubmitted({
    required this.phoneNumber,
    required this.password,
  });
}

class ChangeText extends LoginEvent{
  final String text;

  @override
  List<Object?> get props =>[];

  const ChangeText({
    required this.text,
  });
}

