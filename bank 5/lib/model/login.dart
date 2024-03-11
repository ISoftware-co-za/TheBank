part of "model.dart";

class Login {
  static Future<LoginResult> login(IBankService service, String username, String password) async {
    Map<String, dynamic> response = await service.login();
    Portfolio portfolio = Portfolio.fromJson(response["accounts"]);
    Banks banks = Banks.fromJson(response["banks"]);
    return LoginResult(portfolio, banks);
  }
}
