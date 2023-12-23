import '/components/alt_nav/alt_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page1_widget.dart' show HomePage1Widget;
import 'package:flutter/material.dart';

class HomePage1Model extends FlutterFlowModel<HomePage1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - addList] action in HomePage1 widget.
  double? listmood;
  // Model for altNav component.
  late AltNavModel altNavModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    altNavModel = createModel(context, () => AltNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    altNavModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
