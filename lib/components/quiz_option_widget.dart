import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'quiz_option_model.dart';
export 'quiz_option_model.dart';

class QuizOptionWidget extends StatefulWidget {
  const QuizOptionWidget({
    super.key,
    this.questionNum,
    this.questionName,
    this.isTrue,
    this.value,
  });

  final String? questionNum;
  final String? questionName;
  final bool? isTrue;
  final QuizRecord? value;

  @override
  _QuizOptionWidgetState createState() => _QuizOptionWidgetState();
}

class _QuizOptionWidgetState extends State<QuizOptionWidget> {
  late QuizOptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizOptionModel());

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

    return StreamBuilder<List<QuizRecord>>(
      stream: queryQuizRecord(
        queryBuilder: (quizRecord) => quizRecord.where(
          'question',
          isEqualTo: widget.questionName,
        ),
        singleRecord: true,
      ),
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
        List<QuizRecord> containerQuizRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final containerQuizRecord = containerQuizRecordList.isNotEmpty
            ? containerQuizRecordList.first
            : null;
        return InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            if (widget.isTrue!) {
              if (_model.isAnswered != null) {
                setState(() {
                  _model.isAnswered = false;
                });
                setState(() {
                  FFAppState().completedQuestions =
                      FFAppState().completedQuestions + -1;
                });
                setState(() {
                  FFAppState().totalscore = FFAppState().totalscore + -1;
                });
              } else {
                setState(() {
                  _model.isAnswered = true;
                });
                setState(() {
                  FFAppState().completedQuestions =
                      FFAppState().completedQuestions + 1;
                });
                setState(() {
                  FFAppState().totalscore = FFAppState().totalscore + 1;
                });
              }
            } else {
              if (_model.isAnswered != null) {
                setState(() {
                  _model.isAnswered = false;
                });
                setState(() {
                  FFAppState().completedQuestions =
                      FFAppState().completedQuestions + -1;
                });
              } else {
                setState(() {
                  _model.isAnswered = false;
                });
                setState(() {
                  FFAppState().completedQuestions =
                      FFAppState().completedQuestions + 1;
                });
              }
            }
          },
          child: Container(
            width: double.infinity,
            height: 60.0,
            decoration: BoxDecoration(
              color: () {
                if (_model.isAnswered == true) {
                  return FlutterFlowTheme.of(context).primary;
                } else if (_model.isAnswered == false) {
                  return FlutterFlowTheme.of(context).secondaryBackground;
                } else {
                  return FlutterFlowTheme.of(context).secondaryBackground;
                }
              }(),
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget.questionName,
                      'question',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
