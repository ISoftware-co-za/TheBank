import '../../ui-toolkit/ui_toolkit.dart';

class ListItemMenuItem {
  final String label;
  final String icon;
  final String flowName;
  final List<FormItem> formItems;

  ListItemMenuItem({required this.label, required this.icon, required this.flowName, required this.formItems});

  factory ListItemMenuItem.fromJson(Map<String, dynamic> json) {
    return ListItemMenuItem(
      label: json['label'],
      icon: json['icon'],
      flowName: json['flowName'],
      formItems: (json['formItems'] as List).map((e) => FormItem.fromJson(e)).toList()
    );
  }
}
