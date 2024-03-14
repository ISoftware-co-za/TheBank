part of "model.dart";

class Login {
  static Future<LoginResult> login(IBankService service, String username, String password) async {
    Map<String, dynamic> response = await service.login();
    Portfolio portfolio = Portfolio.fromJson(response["accounts"]);
    List<ListItemMenuItem> menuItems = (response["menu"] as List).map((e) => ListItemMenuItem.fromJson(e)).toList();
    return LoginResult(portfolio, menuItems);
  }
}
