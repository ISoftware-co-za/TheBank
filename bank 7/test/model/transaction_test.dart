import 'package:bank/model/model.dart';
import 'package:test/test.dart';

import 'mock_bank_service.dart';

void main() {
  test('Transaction.perform result', () async {
    var service = MockBankService();
    service.performTransactionResult = "1234-5678";

    var type ="InterAccount";
    Map<String,dynamic> parameters = { "FROM": "1234", "TO": "5678", "AMT": "123.45"};
    var transaction = Transaction(service);
    var actualResult = await transaction.perform(type, parameters);

    expect(actualResult, service.performTransactionResult );
    expect(service.performTransactionType!, type);
    expect(service.performTransactionParameters!["FROM"], "1234");
    expect(service.performTransactionParameters!["TO"], "5678");
    expect(service.performTransactionParameters!["AMT"], 123.45);
  });
}
