import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';

import '../../../index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginModel loginModel = const LoginModel();

  void _handleLoginSubmitted({required bool isDisable}) {
    if (isDisable) {
      return;
    }
    if (loginModel.phoneNumber.isEmpty) {
      showSnackBarError(context, 'phoneNumberEmpty'.tr());
    } else if (loginModel.password.isEmpty) {
      showSnackBarError(context, 'passwordEmpty'.tr());
    } else {
      context.read<LoginBloc>().add(LoginSubmitted(
          phoneNumber: loginModel.phoneNumber, password: loginModel.password));
    }
  }

  void _handleChangePhoneNumber(String value) {
    loginModel = loginModel.copyWith(phoneNumber: value);
  }

  void _handleChangePassword(String value) {
    loginModel = loginModel.copyWith(password: value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.status.isSuccess) {
              // Navigator.pushNamed(context, Routes.home);
              context.navigate(screen: const HomeScreen());
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MySizeBox(
                        height: 48,
                      ),
                      LargeText(
                        text: 'login'.tr(),
                        fontWeight: FontWeight.w600,
                      ),
                      const MySizeBox(
                        height: 44,
                      ),
                      TextFieldWithLabel(
                        label: 'phoneNumber'.tr(),
                        onChange: _handleChangePhoneNumber,
                      ),
                      const MySizeBox(
                        height: 16,
                      ),
                      TextFieldWithLabel(
                        label: 'password'.tr(),
                        onChange: _handleChangePassword,
                        isPassword: true,
                      ),
                      const MySizeBox(
                        height: 24,
                      ),
                      ButtonCustom(
                        text: 'login'.tr().toUpperCase(),
                        onPressed: () => _handleLoginSubmitted(
                            isDisable: state.status.isInProgress),
                        width: double.infinity,
                        height: 48.spMin,
                      ),
                    ],
                  ),
                  if (state.status.isInProgress)
                    const Center(
                      child: CircularProgressIndicator(
                        color: MyColor.primary,
                      ),
                    )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
