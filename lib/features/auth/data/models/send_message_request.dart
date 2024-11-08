class SendCodeRequest {
  SendCodeRequest({
    this.recipient,
    this.text,
    this.registerType,
  });

  SendCodeRequest.fromJson(Map<String, dynamic> json) {
    recipient = json["recipient"];
    text = json["text"];
    registerType = json["type"];
  }

  String? recipient;
  String? text;
  String? registerType;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map["recipient"] = recipient;
    map["text"] = text;
    map["type"] = registerType;
    return map;
  }
}
