part of '../auth_page.dart';

mixin AuthMixin on State<AuthPage> {
  late TextEditingController phoneNumberController;
  late FocusNode phoneNumberFocus;
  late final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    initControllers();
  }

  void initControllers() {
    phoneNumberController = TextEditingController();
    phoneNumberFocus = FocusNode();
  }

  Future<void> pageMovement(AuthState state) async {
    if (state is AuthSuccessState) {
      await context.pushNamed(Routes.confirmCode, extra: state);
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
