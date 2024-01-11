import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/buttons/bottom_navigation_button.dart';
import '../../../../../core/widgets/inputs/custom_phone_text_field.dart';
import '../../bloc/login/login_bloc.dart';

part 'mixin/auth_mixin.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with AuthMixin {
  @override
  Widget build(BuildContext context) => BlocListener<LoginBloc, LoginState>(
        listener: (context, state) async {
          await pageMovement(state);
        },
        listenWhen: (p, c) => p.runtimeType != c.runtimeType,
        child: Scaffold(
          appBar: AppBar(elevation: 0),
          backgroundColor: context.colorScheme.surface,
          body: SafeArea(
            minimum: AppUtils.kPaddingHorizontal16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// title
                Text(context.tr('Ваш номер телефона')),

                /// description
                Text(
                  context.tr('Мы отправим код подтверждения на ваш номер'),
                ),
                AppUtils.kGap16,
                CustomPhoneTextField(
                  titleText: 'Номер телефона',
                  hintText: 'Введите номер телефона',
                  currentFocus: phoneNumberFocus,
                  controller: phoneNumberController,
                ),
                AppUtils.kGap12,

                /// terms of use and privacy
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// checkbox
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ),
                    AppUtils.kGap8,

                    /// caution
                    const Expanded(
                      child: Text(
                        'Регистрируясь, вы соглашаетесь с нашими '
                        'Условиями использования и Политикой '
                        'конфиденциальности',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationButton(
            child: BlocBuilder<LoginBloc, LoginState>(
              buildWhen: (previous, current) =>
                  previous.runtimeType != current.runtimeType,
              builder: (context, state) => ElevatedButton(
                onPressed: state.onPressed(
                  context,
                  phoneNumberController.text,
                ),
                child: const Text('Подтвердить номер телефона'),
              ),
            ),
          ),
        ),
      );
}

extension LoginStateX on LoginState {
  void Function()? onPressed(
    BuildContext context, [
    String? phone,
  ]) {
    switch (runtimeType) {
      case const (LoginPhoneNumberState):
        if ((this as LoginPhoneNumberState).phoneNumber.isNotEmpty) {
          return () {
            context.read<LoginBloc>().add(
                  LoginPhoneButtonPressedEvent(
                    phoneNumber: phone ?? '',
                  ),
                );
          };
        } else {
          return null;
        }
      case const (LoginCodeState):
        if ((this as LoginCodeState).code.isNotEmpty) {
          return () {
            context.read<LoginBloc>().add(
                  const LoginCodeButtonPressedEvent(
                    code: '',
                  ),
                );
          };
        } else {
          return null;
        }
      default:
        return null;
    }
  }
}
