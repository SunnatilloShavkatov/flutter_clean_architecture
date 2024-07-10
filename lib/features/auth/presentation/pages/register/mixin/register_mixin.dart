part of "../register_page.dart";

mixin RegisterMixin on State<RegisterPage> {
  late TextEditingController firstNameController;
  late FocusNode firstNameFocus;
  late TextEditingController lastNameController;
  late FocusNode lastNameFocus;
  late TextEditingController emailController;
  late FocusNode emailFocus;
  late TextEditingController passwordController;
  late FocusNode passwordFocus;
  late TextEditingController confirmPasswordController;
  late FocusNode confirmPasswordFocus;

  @override
  void initState() {
    super.initState();
    initTextControllers();
  }

  void initTextControllers() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    firstNameFocus = FocusNode();
    lastNameFocus = FocusNode();
    emailFocus = FocusNode();
    passwordFocus = FocusNode();
    confirmPasswordFocus = FocusNode();
  }

  void disposeTextControllers() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameFocus.dispose();
    lastNameFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
  }

  void requestFocusNode(RegisterInputErrors? errors) {}

  @override
  void dispose() {
    disposeTextControllers();
    super.dispose();
  }
}
