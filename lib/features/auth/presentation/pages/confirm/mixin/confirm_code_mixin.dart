part of '../confirm_code_page.dart';

mixin ConfirmCodeMixin on State<ConfirmCodePage> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
