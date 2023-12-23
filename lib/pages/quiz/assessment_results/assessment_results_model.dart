import '/flutter_flow/flutter_flow_util.dart';
import 'assessment_results_widget.dart' show AssessmentResultsWidget;
import 'package:flutter/material.dart';

class AssessmentResultsModel extends FlutterFlowModel<AssessmentResultsWidget> {
  ///  Local state fields for this page.

  String? results = ' ';

  String? imgPath = 'false';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - chatGPTres] action in Button widget.
  String? chatGptResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
