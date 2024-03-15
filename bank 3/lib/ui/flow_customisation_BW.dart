import 'package:bank/model/model.dart';
import 'package:bank/ui-toolkit/ui_toolkit.dart' as ui_toolkit;
import 'package:bank/ui/i_flow_customisation.dart';
import 'package:bank/ui/selector_name_value/list_item_name_value.dart';
import 'package:flutter/material.dart';

import '../ui-toolkit/ui_toolkit.dart';
import 'interbank/inter_bank_flow_data.dart';
import 'interbank/page_1_instruction_form.dart';
import 'interbank/value_generator_branch.dart';

class FlowCustomisationBW implements IFlowCustomisation {

  @override
  void interAccountReferenceValidation(Field reference) {
    reference.addValidation(ValidationRequired("Reference is required"));
    reference.addValidation(ValidationCharacterLength(
        maximumCharacters: 20,
        maximumCharactersMessage:  "Reference is too long"));
  }

  @override
  void interbankReferenceValidation(Field reference) {
    reference.addValidation(ValidationRequired("Reference is required"));
    reference.addValidation(ValidationCharacterLength(
        maximumCharacters: 20, maximumCharactersMessage: "Reference is too long"));
  }

  @override
  ui_toolkit.Field? interbankAddBranchSelectionField(ui_toolkit.Form form) {
    var toBranch = ui_toolkit.Field("Branch", null);
    toBranch.addValidation(ui_toolkit.ValidationRequired("Branch is required"));
    form.add(toBranch);
    return toBranch;
  }

  @override
  void interbankAddBranchSelectionWidget(List<Widget> children, InstructionForm form, double? spacing) {
    List<Branch>? branches = form.payment.listBranches(form.toBank
        .getValueAs<ListItemNameValue>()
        .value);
    if (branches != null && branches.isNotEmpty) {
      children.add(WidgetNameValueSelection(
          field: form.toBranch!, valuesGenerator: ValueGeneratorBranch(branches), textController:  form.toBranchTextController));
      children.add(SizedBox(height: spacing));
    }
  }

  @override
  void interbankAddBranchWidgetLabelValue(List<Widget> children, InterBankFlowData data) {
    children.add(WidgetLabelValue(label: "To branch", value: data.toBranch.toString()));
  }
}
