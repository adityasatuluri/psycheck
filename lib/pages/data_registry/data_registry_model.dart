import '/flutter_flow/flutter_flow_util.dart';
import 'data_registry_widget.dart' show DataRegistryWidget;
import 'package:flutter/material.dart';

class DataRegistryModel extends FlutterFlowModel<DataRegistryWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarController;
  String? Function(BuildContext, String?)? searchBarControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    searchBarFocusNode?.dispose();
    searchBarController?.dispose();

    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
