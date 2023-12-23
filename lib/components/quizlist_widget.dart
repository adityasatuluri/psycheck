import '/backend/backend.dart';
import '/components/quiz_sets_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'quizlist_model.dart';
export 'quizlist_model.dart';

class QuizlistWidget extends StatefulWidget {
  const QuizlistWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
  });

  final String? parameter1;
  final String? parameter2;
  final int? parameter3;
  final String? parameter4;

  @override
  _QuizlistWidgetState createState() => _QuizlistWidgetState();
}

class _QuizlistWidgetState extends State<QuizlistWidget> {
  late QuizlistModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizlistModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: false,
      child: StreamBuilder<List<QuizSetRecord>>(
        stream: queryQuizSetRecord(),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return const Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF551199),
                  ),
                ),
              ),
            );
          }
          List<QuizSetRecord> listViewQuizSetRecordList = snapshot.data!;
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: listViewQuizSetRecordList.length,
            itemBuilder: (context, listViewIndex) {
              final listViewQuizSetRecord =
                  listViewQuizSetRecordList[listViewIndex];
              return Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: QuizSetsWidget(
                  key: Key(
                      'Key4km_${listViewIndex}_of_${listViewQuizSetRecordList.length}'),
                  title: listViewQuizSetRecord.quizName,
                  description: listViewQuizSetRecord.description,
                  quizDuration: listViewQuizSetRecord.duration / 60000,
                  coverImage: listViewQuizSetRecord.coverPhoto,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
