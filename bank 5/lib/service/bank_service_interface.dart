part of "bank_service.dart";

abstract class IBankService {
  Future<Map<String, dynamic>> loadConfiguration();
  Future<Map<String, dynamic>> listAccounts();
  Future<Map<String, dynamic>> startOffUs();
  Future<Map<String, dynamic>> login();
  Future<String> performTransaction(String sourceAccountNumber, Object destination, double amount, [String? reference, String? param1, String? param2, String? param3]);
}
