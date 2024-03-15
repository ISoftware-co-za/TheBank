part of "model.dart";

class Branch {
  final String name;
  final String code;

  Branch(this.name, this.code);

  @visibleForTesting
  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(json["name"], json["code"]);
  }
}
