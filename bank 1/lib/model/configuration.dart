part of "model.dart";

class Configuration {
  final String country;

  bool isBW() => country == "BW";
  bool isZM() => country == "ZM";

  Configuration(this.country);

  static Future<Configuration> load(IBankService service) async {
    Map<String, dynamic> response = await service.loadConfiguration();
    return Configuration.fromJson(response);
  }

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return Configuration(json["country"]);
  }
}
