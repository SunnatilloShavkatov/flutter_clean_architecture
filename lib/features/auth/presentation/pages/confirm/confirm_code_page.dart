import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../../../constants/constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/buttons/bottom_navigation_button.dart';
import '../../../../../router/app_routes.dart';
import '../../../data/models/confirm/verify_request.dart';
import '../../bloc/confirm/confirm_code_bloc.dart';
import '../../bloc/login/auth_bloc.dart';
import '../register/args/register_args.dart';

part 'mixin/confirm_code_mixin.dart';

class ConfirmCodePage extends StatefulWidget {
  const ConfirmCodePage({
    super.key,
    required this.authState,
  });

  final AuthSuccessState authState;

  @override
  State<ConfirmCodePage> createState() => _ConfirmCodePageState();
}

class _ConfirmCodePageState extends State<ConfirmCodePage>
    with ConfirmCodeMixin {
  @override
  Widget build(BuildContext context) =>
      BlocListener<ConfirmCodeBloc, ConfirmCodeState>(
        listener: (_, state) async {
          if (state.confirmCodeStatus.isConfirmed) {
            if (state.isUserFound) {
              unawaited(localSource.setHasProfile(value: true));
              context.pop(true);
            } else {
              final result = await context.pushNamed(
                Routes.register,
                extra: RegisterArgs(
                  isUserAgree: true,
                  phone: widget.authState.phone,
                ),
              );
              if (result != null) {
                if (!context.mounted) return;
                context.pop(true);
              }
            }
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Введите код подтверждения'),
          ),
          body: BlocBuilder<ConfirmCodeBloc, ConfirmCodeState>(
            builder: (context, state) => Padding(
              padding: AppUtils.kPaddingAll16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RichText(
                    text: TextSpan(
                      style: context.textTheme.titleMedium,
                      text: 'Мы отправили код подтверждения\nна номер ',
                      children: [
                        TextSpan(
                          text: '+998 ${widget.authState.uiPhone}',
                        ),
                      ],
                    ),
                  ),
                  AppUtils.kGap32,
                  Center(
                    child: PinFieldAutoFill(
                      enableInteractiveSelection: false,
                      cursor: Cursor(
                        color: context.colorScheme.primary,
                        enabled: true,
                        width: 2,
                        height: 30,
                      ),
                      controller: controller,
                      autoFocus: true,
                      currentCode: controller.text.trim(),
                      onCodeSubmitted: (code) {},
                      onCodeChanged: (v) {},
                      decoration: BoxLooseDecoration(
                        textStyle: context.textTheme.titleMedium,
                        strokeColorBuilder: FixedColorBuilder(
                          context.colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BlocBuilder<ConfirmCodeBloc, ConfirmCodeState>(
            builder: (_, state) => BottomNavigationButton(
              child: ElevatedButton(
                onPressed: () {
                  context.read<ConfirmCodeBloc>().add(
                        ConfirmCodeCheckMessageEvent(
                          data: VerifyRequestData(
                            smsId: widget.authState.smsId,
                            phone: widget.authState.phone,
                            roleId: Constants.roleId,
                            otp: controller.text,
                            clientTypeId: Constants.clientTypeId,
                          ),
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
