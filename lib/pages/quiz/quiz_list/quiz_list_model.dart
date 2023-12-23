import '/flutter_flow/flutter_flow_util.dart';
import 'quiz_list_widget.dart' show QuizListWidget;
import 'package:flutter/material.dart';

class QuizListModel extends FlutterFlowModel<QuizListWidget> {
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
