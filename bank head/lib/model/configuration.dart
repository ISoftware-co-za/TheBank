part of "model.dart";

class Configuration {
  final String country;
  final bool interAccountReferenceRequired;
  final int interAccountReferenceMaxLength;

  Configuration(this.country, this.interAccountReferenceRequired, this.interAccountReferenceMaxLength);

  static Future<Configuration> load(IBankService service) async {
    Map<String, dynamic> response = await service.loadConfiguration();
    return Configuration.fromJson(response);
  }

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return Configuration(
        json["country"], json["interAccountReferenceRequired"], json["interAccountReferenceMaxLength"]);
  }
}
