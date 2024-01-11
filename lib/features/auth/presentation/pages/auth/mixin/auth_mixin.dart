part of '../auth_page.dart';

mixin AuthMixin on State<AuthPage> {
  late TextEditingController phoneNumberController;
  late FocusNode phoneNumberFocus;

  @override
  void initState() {
    super.initState();
    initControllers();
  }

  void initControllers() {
    phoneNumberController = TextEditingController();
    phoneNumberFocus = FocusNode();
  }

  Future<void> pageMovement(LoginState state) async {
    switch (state.runtimeType) {
      case LoginPhoneNumberState _:
      case LoginCodeState _:
    }
  }

  void disposeControllers() {
    phoneNumberController.dispose();
    phoneNumberFocus.dispose();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }
}
