class VerifyRequest {
  const VerifyRequest({
    required this.verifyData,
    required this.loginStrategy,
    required this.tables,
  });

  final VerifyRequestData verifyData;
  final String loginStrategy;
  final List<dynamic> tables;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = verifyData.toJson();
    data['login_strategy'] = loginStrategy;
    data['tables'] = tables;
    return data;
  }
}

class VerifyRequestData {
  const VerifyRequestData({
    required this.smsId,
    required this.phone,
    required this.roleId,
    required this.otp,
    required this.clientTypeId,
  });

  final String smsId;
  final String phone;
  final String roleId;
  final String otp;
  final String clientTypeId;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'sms_id': smsId,
        'phone': phone,
        'role_id': roleId,
        'otp': otp,
        'client_type_id': clientTypeId,
      };
}
