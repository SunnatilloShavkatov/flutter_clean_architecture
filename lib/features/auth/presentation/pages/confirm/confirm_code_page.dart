import "dart:async";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_clean_architecture/constants/constants.dart";
import "package:flutter_clean_architecture/core/extension/extension.dart";
import "package:flutter_clean_architecture/core/utils/utils.dart";
import "package:flutter_clean_architecture/core/widgets/buttons/bottom_navigation_button.dart";
import "package:flutter_clean_architecture/features/auth/data/models/confirm/verify_request.dart";
import "package:flutter_clean_architecture/features/auth/presentation/bloc/confirm/confirm_code_bloc.dart";
import "package:flutter_clean_architecture/features/auth/presentation/bloc/login/auth_bloc.dart";
import "package:flutter_clean_architecture/features/auth/presentation/pages/register/args/register_args.dart";
import "package:flutter_clean_architecture/router/app_routes.dart";
import "package:gap/gap.dart";
import "package:go_router/go_router.dart";
import "package:pinput/pinput.dart";

part "mixin/confirm_code_mixin.dart";

class ConfirmCodePage extends StatefulWidget {
  const ConfirmCodePage({
    required this.authState,
    super.key,
  });

  final AuthSuccessState authState;

  @override
  State<ConfirmCodePage> createState() => _ConfirmCodePageState();
}

class _ConfirmCodePageState extends State<ConfirmCodePage>
    with ConfirmCodeMixin {
  @override
  Widget build(BuildContext context) {
    final double gap = (context.width - 32 - 52 * 6) / 5;
    final PinTheme defaultPinTheme = PinTheme(
      width: 52,
      height: 52,
      textStyle: context.textTheme.titleMedium,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.colorScheme.outline),
      ),
    );
    return BlocListener<ConfirmCodeBloc, ConfirmCodeState>(
      listener: (_, ConfirmCodeState state) async {
        if (state.confirmCodeStatus.isConfirmed) {
          if (state.isUserFound) {
            unawaited(localSource.setHasProfile(value: true));
            context.pop(true);
          } else {
            final Object? result = await context.pushNamed(
              Routes.register,
              extra: RegisterArgs(
                isUserAgree: true,
                phone: widget.authState.phone,
              ),
            );
            if (result != null && context.mounted) {
              context.pop(true);
            }
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Введите код подтверждения"),
        ),
        body: BlocBuilder<ConfirmCodeBloc, ConfirmCodeState>(
          builder: (BuildContext context, ConfirmCodeState state) => Padding(
            padding: AppUtils.kPaddingAll16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    style: context.textTheme.titleMedium,
                    text: "Мы отправили код подтверждения\nна номер ",
                    children: <InlineSpan>[
                      TextSpan(
                        text: "+998 ${widget.authState.uiPhone}",
                      ),
                    ],
                  ),
                ),
                AppUtils.kGap32,
                Pinput(
                  length: 6,
                  controller: otpController,
                  focusNode: otpFocusNode,
                  autofocus: true,
                  separatorBuilder: (_) => Gap(gap),
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (String pin) {},
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (String value) {
                    // if (value.length == 6) {
                    //   formKey.currentState?.validate();
                    // }
                  },
                  validator: (String? value) {
                    if (value != null && value.length != 6) {
                      return context.tr("enter_code");
                    }
                    return null;
                  },
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: context.colorScheme.primary),
                  ),
                  submittedPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: context.colorScheme.primary),
                  ),
                  errorPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: context.colorScheme.error),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BlocBuilder<ConfirmCodeBloc, ConfirmCodeState>(
          builder: (_, ConfirmCodeState state) => BottomNavigationButton(
            child: ElevatedButton(
              onPressed: () {
                context.read<ConfirmCodeBloc>().add(
                      ConfirmCodeCheckMessageEvent(
                        data: VerifyRequestData(
                          smsId: widget.authState.smsId,
                          phone: widget.authState.phone,
                          roleId: Constants.roleId,
                          otp: otpController.text,
                          clientTypeId: Constants.clientTypeId,
                        ),
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
}
