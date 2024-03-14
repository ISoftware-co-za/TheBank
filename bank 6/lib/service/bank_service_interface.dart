part of "bank_service.dart";

abstract class IBankService {
  Future<Map<String, dynamic>> loadConfiguration();
  Future<Map<String, dynamic>> login();
  Future<String> performTransaction(String type, Map<String,dynamic> parameters);
}
