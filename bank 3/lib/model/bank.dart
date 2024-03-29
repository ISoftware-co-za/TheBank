part of "model.dart";

class Bank {
  final String name;
  final String id;
  final List<Branch>? branches;

  Bank(this.name, this.id, this.branches);

  @visibleForTesting
  factory Bank.fromJson(Map<String, dynamic> json) {
    List<Branch> branches = (json["branches"] as List).map((branch) => Branch.fromJson(branch)).toList();
    return Bank(json["name"], json["id"], branches);
  }
}
