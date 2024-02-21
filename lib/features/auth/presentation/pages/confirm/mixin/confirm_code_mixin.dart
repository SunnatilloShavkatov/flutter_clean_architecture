part of "../confirm_code_page.dart";

mixin ConfirmCodeMixin on State<ConfirmCodePage> {
  late final OTPTextEditController controller;
  late final OTPInteractor _otpInteractor;

  @override
  void initState() {
    super.initState();
    unawaited(_initInteractor());
    controller = OTPTextEditController(
      codeLength: 6,
      onCodeReceive: (String code) {
        log("Your Application receive code - $code");
      },
      otpInteractor: _otpInteractor,
    );
  }

  Future<void> _initInteractor() async {
    _otpInteractor = OTPInteractor();
    if (Platform.isAndroid) {
      // You can receive your app signature by using this method.
      final String? appSignature = await _otpInteractor.getAppSignature();

      if (kDebugMode) {
        print("Your app signature: $appSignature");
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
