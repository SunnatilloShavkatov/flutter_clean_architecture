import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_clean_architecture/core/extension/extension.dart";
import "package:flutter_clean_architecture/core/utils/utils.dart";
import "package:flutter_clean_architecture/core/widgets/buttons/bottom_navigation_button.dart";
import "package:flutter_clean_architecture/core/widgets/buttons/custom_loading_button.dart";
import "package:flutter_clean_architecture/core/widgets/inputs/custom_phone_text_field.dart";
import "package:flutter_clean_architecture/features/auth/presentation/bloc/login/auth_bloc.dart";
import "package:flutter_clean_architecture/router/app_routes.dart";
import "package:go_router/go_router.dart";

part "mixin/auth_mixin.dart";

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with AuthMixin {
  @override
  Widget build(BuildContext context) => BlocListener<AuthBloc, AuthState>(
        listener: (BuildContext context, AuthState state) async {
          await pageMovement(state);
        },
        listenWhen: (AuthState p, AuthState c) =>
            p.runtimeType != c.runtimeType,
        child: Scaffold(
          appBar: AppBar(elevation: 0),
          backgroundColor: context.colorScheme.surface,
          body: Form(
            key: _formKey,
            child: SafeArea(
              minimum: AppUtils.kPaddingHor16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /// title
                  Text(context.tr("Ваш номер телефона")),

                  /// description
                  Text(
                    context.tr("Мы отправим код подтверждения на ваш номер"),
                  ),
                  AppUtils.kGap16,
                  CustomPhoneTextField(
                    titleText: "Номер телефона",
                    hintText: "Введите номер телефона",
                    currentFocus: phoneNumberFocus,
                    controller: phoneNumberController,
                    validator: (String? value) {
                      if (value != null && value.length == 12) {
                        return null;
                      }
                      return "Введите номер телефона";
                    },
                  ),
                  AppUtils.kGap12,

                  /// terms of use and privacy
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      /// checkbox
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: Checkbox(
                          value: true,
                          onChanged: (bool? value) {},
                        ),
                      ),
                      AppUtils.kGap8,

                      /// caution
                      const Expanded(
                        child: Text(
                          "Регистрируясь, вы соглашаетесь с нашими "
                          "Условиями использования и Политикой "
                          "конфиденциальности",
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
              buildWhen: (AuthState previous, AuthState current) =>
                  previous.runtimeType != current.runtimeType,
              builder: (BuildContext context, AuthState state) =>
                  CustomLoadingButton(
                isLoading: state is AuthLoadingState,
                onPressed: () {
                  // if (!_formKey.currentState!.validate()) {
                  //   return;
                  // }
                  // _formKey.currentState!.save();
                  // context.read<AuthBloc>().add(
                  //       LoginPhoneButtonPressedEvent(
                  //         phoneNumber: phoneNumberController.text.trim(),
                  //       ),
                  //     );
                  // ignore: discarded_futures
                  context.pushNamed(
                    Routes.confirmCode,
                    extra: const AuthSuccessState(
                      smsId: "",
                      phone: "",
                      uiPhone: "",
                      data: <String, dynamic>{},
                    ),
                  );
                },
                child: const Text("Продолжить"),
              ),
            ),
          ),
        ),
      );
}
