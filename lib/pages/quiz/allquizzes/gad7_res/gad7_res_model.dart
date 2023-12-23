import '/flutter_flow/flutter_flow_util.dart';
import 'gad7_res_widget.dart' show Gad7ResWidget;
import 'package:flutter/material.dart';

class Gad7ResModel extends FlutterFlowModel<Gad7ResWidget> {
  ///  Local state fields for this page.

  int pageNavigate = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - chatGPTres] action in gad7Res widget.
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
