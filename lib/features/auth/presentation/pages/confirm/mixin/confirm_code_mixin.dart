part of "../confirm_code_page.dart";

mixin ConfirmCodeMixin on State<ConfirmCodePage> {
  late final TextEditingController otpController = TextEditingController();
  late final FocusNode otpFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    otpController.dispose();
    otpFocusNode.dispose();
    super.dispose();
  }
}
