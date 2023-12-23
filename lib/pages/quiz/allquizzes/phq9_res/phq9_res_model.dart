import '/flutter_flow/flutter_flow_util.dart';
import 'phq9_res_widget.dart' show Phq9ResWidget;
import 'package:flutter/material.dart';

class Phq9ResModel extends FlutterFlowModel<Phq9ResWidget> {
  ///  Local state fields for this page.

  int pageNavigate = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - chatGPTres] action in phq9Res widget.
  String? chatGptResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
