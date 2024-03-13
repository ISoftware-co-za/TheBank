import 'package:bank/ui-toolkit/ui_toolkit.dart' as ui_toolkit;
import 'package:flutter/material.dart';

import 'interbank/inter_bank_flow_data.dart';
import 'interbank/page_1_instruction_form.dart';

abstract class IFlowCustomisation {
  void interAccountReferenceValidation(ui_toolkit.Field reference);

  void interbankReferenceValidation(ui_toolkit.Field reference);
  ui_toolkit.Field? interbankAddBranchSelectionField(ui_toolkit.Form form);
  void interbankAddBranchSelectionWidget(List<Widget> children, InstructionForm form, double? spacing);
  void interbankAddBranchWidgetLabelValue(List<Widget> children, InterBankFlowData data);
}
