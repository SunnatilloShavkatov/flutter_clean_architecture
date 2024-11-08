import "package:flutter/foundation.dart";

@immutable
class SendMessageResponse {
  const SendMessageResponse({
    this.status,
    this.description,
    this.data,
    this.message,
  });

  factory SendMessageResponse.fromJson(Map<String, dynamic> json) =>
      SendMessageResponse(
        status: json["message"],
        description: json["error"],
        data: json["data"] is Map<String, dynamic>
            ? json["data"]
            : <String, dynamic>{},
        message: json["data"] is String ? json["data"] : "",
      );

  final String? status;
  final String? description;
  final Map<String, dynamic>? data;
  final String? message;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is SendMessageResponse &&
        other.status == status &&
        other.description == description &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ description.hashCode ^ data.hashCode;
}
