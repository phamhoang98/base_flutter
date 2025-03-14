part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzSubmissionStatus.initial,
    this.textA,
  });

  final FormzSubmissionStatus status;
  final String? textA;

  @override
  List<Object?> get props => [status, textA];

  LoginState copyWith({
    FormzSubmissionStatus? status,
    String? textA,
  }) {
    return LoginState(
      status: status ?? this.status,
      textA: textA ?? this.textA,
    );
  }
}
