part of "model.dart";

class Configuration {
  final String country;
  final Banks banks;

  bool isBW() => country == "BW";
  bool isZM() => country == "ZM";

  Configuration(this.country, this.banks);

  static Future<Configuration> load(IBankService service) async {
    Map<String, dynamic> response = await service.loadConfiguration();
    return Configuration.fromJson(response);
  }

  @visibleForTesting
  static Configuration fromJson(Map<String, dynamic> json) {
    Banks banks = Banks.fromJson(json["banks"]);
    return Configuration(json["country"], banks);
  }
}
