import 'package:bank/model/model.dart';

import 'menu/list_item_menu_item.dart';

class SessionState {
  final Portfolio portfolio;
  final List<ListItemMenuItem> menuItems;

  SessionState(this.portfolio, this.menuItems);
}
