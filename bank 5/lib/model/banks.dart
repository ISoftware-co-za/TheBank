part of "model.dart";

class Banks {
  final bool hasBranches;
  final List<Bank> banks;

  Banks(this.hasBranches, this.banks);

  List<Branch>? listBranchedForBank(String bankId) {
    return banks.firstWhere((bank) => bank.id == bankId).branches;
  }

  @visibleForTesting
  factory Banks.fromJson(dynamic json) {
    bool isFirstBranch = true;
    bool hasBranches = false;
    List<Bank> banks = [];
    for(Map<String, dynamic> bankJson in json) {
        if (isFirstBranch) {
          isFirstBranch = false;
          hasBranches = bankJson["branches"] != null;
        }
        var bank = Bank.fromJson(bankJson);
        banks.add(bank);
    }
    return Banks(hasBranches, banks);
  }
}
