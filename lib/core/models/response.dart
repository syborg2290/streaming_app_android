import 'dart:convert';

Response responseFromJson(String str) => Response.fromJson(json.decode(str));

String responseToJson(Response data) => json.encode(data.toJson());

class Response {
  dynamic result;
  String? message;

  Response({
    this.result,
    this.message,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        result: json["result"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
      };
}
