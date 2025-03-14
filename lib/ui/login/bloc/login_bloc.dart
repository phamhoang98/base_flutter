import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<ChangeText>(_onChangeText);
  }

  Future<void> _onLoginSubmitted(LoginSubmitted event,Emitter<LoginState> emit)async{
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    await Future.delayed(const Duration(seconds: 2),(){
        emit(state.copyWith(status: FormzSubmissionStatus.success));
    });
  }

  Future<void> _onChangeText(ChangeText event,Emitter<LoginState> emit)async{
    emit(state.copyWith(textA: event.text));
  }
}
