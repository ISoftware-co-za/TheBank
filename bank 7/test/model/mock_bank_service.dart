import 'package:bank/service/bank_service.dart';

class MockBankService implements IBankService {

  @override
  Future<Map<String, dynamic>> loadConfiguration() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> login() {
    throw UnimplementedError();
  }

  String? performTransactionResult;
  String? performTransactionType;
  Map<String, dynamic>? performTransactionParameters;
  @override
  Future<String> performTransaction(String type, Map<String, dynamic> parameters) {
    performTransactionType = type;
    performTransactionParameters = parameters;
    return Future(() => performTransactionResult!);
  }
}
