library bank_service;

import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart' show Uint8List, rootBundle;

part "bank_service_interface.dart";

// const String countryCode = "BW";
const String countryCode = "KE";
// const String countryCode = "ZM";

class BankService implements IBankService {

  @override
  Future<Map<String, dynamic>> loadConfiguration() async {
    String configurationFile = "assets/configuration_$countryCode.json";
    return await _readJSONFile(configurationFile);
  }

  @override
  Future<Map<String, dynamic>> listAccounts() async {
    return await _readJSONFile("assets/responses/listAccountsResponse.json");
  }

  @override
  Future<Map<String, dynamic>> startOffUs() async {
    String responseFile = "assets/responses/startOffUsResponse_$countryCode.json";
    return await _readJSONFile(responseFile);
  }

  @override
  Future<String> performTransaction(String sourceAccountNumber, Object destination, double amount, [String? reference, String? param1, String? param2, String? param3]) async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _generateReferenceNumber(); // Convert to bytes and base64 encode
  }

  Future<Map<String, dynamic>> _readJSONFile(String name) async {
    String jsonString = await rootBundle.loadString(name);
    return json.decode(jsonString);
  }

  String _generateReferenceNumber() {
    List<int> digits = [];
    final random = Random();
    for (int i = 0; i < 10; i++) {
      digits.add(random.nextInt(10));
    }
    return base64Encode(Uint8List.fromList(digits)); // Convert to bytes and base64 encode
  }

}

