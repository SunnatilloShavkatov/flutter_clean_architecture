import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/buttons/bottom_navigation_button.dart';
import '../../../../../core/widgets/buttons/custom_loading_button.dart';
import '../../../../../core/widgets/inputs/custom_phone_text_field.dart';
import '../../../../../router/app_routes.dart';
import '../../bloc/login/auth_bloc.dart';

part 'mixin/auth_mixin.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with AuthMixin {
  @override
  Widget build(BuildContext context) => BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          await pageMovement(state);
        },
        listenWhen: (p, c) => p.runtimeType != c.runtimeType,
        child: Scaffold(
          appBar: AppBar(elevation: 0),
          backgroundColor: context.colorScheme.surface,
          body: Form(
            key: _formKey,
            child: SafeArea(
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
                    validator: (value) {
                      if (value != null && value.length == 12) {
                        return null;
                      }
                      return 'Введите номер телефона';
                    },
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
          ),
          bottomNavigationBar: BottomNavigationButton(
            child: BlocBuilder<AuthBloc, AuthState>(
              buildWhen: (previous, current) =>
                  previous.runtimeType != current.runtimeType,
              builder: (context, state) => CustomLoadingButton(
                isLoading: state is AuthLoadingState,
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;
                  _formKey.currentState!.save();
                  context.read<AuthBloc>().add(
                        LoginPhoneButtonPressedEvent(
                          phoneNumber: phoneNumberController.text.trim(),
                        ),
                      );
                },
                child: const Text('Продолжить'),
              ),
            ),
          ),
        ),
      );
}
