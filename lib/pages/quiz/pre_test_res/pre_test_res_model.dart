import '/flutter_flow/flutter_flow_util.dart';
import 'pre_test_res_widget.dart' show PreTestResWidget;
import 'package:flutter/material.dart';

class PreTestResModel extends FlutterFlowModel<PreTestResWidget> {
  ///  Local state fields for this page.

  int pageNavigate = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

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
