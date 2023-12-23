import '/flutter_flow/flutter_flow_util.dart';
import 'mood_tracker_widget.dart' show MoodTrackerWidget;
import 'package:flutter/material.dart';

class MoodTrackerModel extends FlutterFlowModel<MoodTrackerWidget> {
  ///  Local state fields for this component.

  LatLng? inf;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Custom Action - addList] action in Button widget.
  double? weeksum;
  // Stores action output result for [Custom Action - addList] action in Button widget.
  double? monthsum;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
