import 'package:bank/ui-toolkit/ui_toolkit.dart' as ui_toolkit;
import 'package:bank/ui/iFlowCustomisation.dart';
import 'package:bank/ui/interbank/inter_bank_flow_data.dart';
import 'package:flutter/material.dart';

import 'interbank/page_1_instruction_form.dart';

class FlowCustomisationZM implements IFlowCustomisation {
  @override
  void interAccountReferenceValidation(ui_toolkit.Field reference) {
    reference.addValidation(ui_toolkit.ValidationCharacterLength(
        maximumCharacters: 15, maximumCharactersMessage:  "Reference is too long"));
  }

  @override
  void interbankReferenceValidation(ui_toolkit.Field reference) {
    reference.addValidation(ui_toolkit.ValidationCharacterLength(
        maximumCharacters: 15, maximumCharactersMessage: "Reference is too long"));
  }

  @override
  ui_toolkit.Field? interbankAddBranchSelectionField(ui_toolkit.Form form) {
    return null;
  }

  @override
  void interbankAddBranchSelectionWidget(List<Widget> children, InstructionForm form, double? spacing) {
  }

  @override
  void interbankAddBranchWidgetLabelValue(List<Widget> children, InterBankFlowData data) {
  }
}
