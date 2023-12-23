import '/backend/backend.dart';
import '/components/quiz_option_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'quiz_model.dart';
export 'quiz_model.dart';

class QuizWidget extends StatefulWidget {
  const QuizWidget({
    super.key,
    required this.quizSet,
  });

  final DocumentReference? quizSet;

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> with TickerProviderStateMixin {
  late QuizModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 50.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'rcrkeqcx' /* Health Assessment */,
            ),
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).displaySmallFamily),
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 0.0),
                  child: Text(
                    'Question${valueOrDefault<String>(
                      (_model.pageNavigate + 1).toString(),
                      '0',
                    )}',
                    style: FlutterFlowTheme.of(context).labelMedium,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 8.0, 0.0),
                child: LinearPercentIndicator(
                  percent: 0.6,
                  width: MediaQuery.sizeOf(context).width * 0.96,
                  lineHeight: 12.0,
                  animation: true,
                  animateFromLastPercent: true,
                  progressColor: FlutterFlowTheme.of(context).primary,
                  backgroundColor: const Color(0xFFE0E3E7),
                  barRadius: const Radius.circular(24.0),
                  padding: EdgeInsets.zero,
                ),
              ),
              Container(
                width: double.infinity,
                height: 500.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: StreamBuilder<List<QuizRecord>>(
                  stream: queryQuizRecord(
                    queryBuilder: (quizRecord) => quizRecord.where(
                      'quiz_set',
                      isEqualTo: widget.quizSet,
                    ),
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
                    List<QuizRecord> pageViewQuizRecordList = snapshot.data!;
                    return SizedBox(
                      width: 709.0,
                      height: 800.0,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 40.0),
                            child: PageView.builder(
                              controller: _model.pageViewController ??=
                                  PageController(
                                      initialPage: min(0,
                                          pageViewQuizRecordList.length - 1)),
                              scrollDirection: Axis.horizontal,
                              itemCount: pageViewQuizRecordList.length,
                              itemBuilder: (context, pageViewIndex) {
                                final pageViewQuizRecord =
                                    pageViewQuizRecordList[pageViewIndex];
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 20.0, 0.0, 0.0),
                                        child: Text(
                                          pageViewQuizRecord.question,
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall,
                                        ).animateOnPageLoad(animationsMap[
                                            'textOnPageLoadAnimation']!),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 20.0, 16.0, 0.0),
                                        child: ListView(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 5.0),
                                              child: StreamBuilder<
                                                  List<QuestionARecord>>(
                                                stream: queryQuestionARecord(
                                                  parent: pageViewQuizRecord
                                                      .reference,
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return const Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            Color(0xFF551199),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<QuestionARecord>
                                                      quizOptionQuestionARecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final quizOptionQuestionARecord =
                                                      quizOptionQuestionARecordList
                                                              .isNotEmpty
                                                          ? quizOptionQuestionARecordList
                                                              .first
                                                          : null;
                                                  return QuizOptionWidget(
                                                    key: Key(
                                                        'Key7b8_${pageViewIndex}_of_${pageViewQuizRecordList.length}'),
                                                    questionName:
                                                        quizOptionQuestionARecord
                                                            ?.question,
                                                    isTrue:
                                                        quizOptionQuestionARecord
                                                            ?.isTrue,
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 5.0),
                                              child: StreamBuilder<
                                                  List<QuestionBRecord>>(
                                                stream: queryQuestionBRecord(
                                                  parent: pageViewQuizRecord
                                                      .reference,
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return const Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            Color(0xFF551199),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<QuestionBRecord>
                                                      quizOptionQuestionBRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final quizOptionQuestionBRecord =
                                                      quizOptionQuestionBRecordList
                                                              .isNotEmpty
                                                          ? quizOptionQuestionBRecordList
                                                              .first
                                                          : null;
                                                  return QuizOptionWidget(
                                                    key: Key(
                                                        'Keyke5_${pageViewIndex}_of_${pageViewQuizRecordList.length}'),
                                                    questionName:
                                                        quizOptionQuestionBRecord
                                                            ?.question,
                                                    isTrue:
                                                        quizOptionQuestionBRecord
                                                            ?.isTrue,
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: StreamBuilder<
                                                  List<QuestionCRecord>>(
                                                stream: queryQuestionCRecord(
                                                  parent: pageViewQuizRecord
                                                      .reference,
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return const Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            Color(0xFF551199),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<QuestionCRecord>
                                                      quizOptionQuestionCRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final quizOptionQuestionCRecord =
                                                      quizOptionQuestionCRecordList
                                                              .isNotEmpty
                                                          ? quizOptionQuestionCRecordList
                                                              .first
                                                          : null;
                                                  return QuizOptionWidget(
                                                    key: Key(
                                                        'Keyqte_${pageViewIndex}_of_${pageViewQuizRecordList.length}'),
                                                    questionName:
                                                        quizOptionQuestionCRecord
                                                            ?.question,
                                                    isTrue:
                                                        quizOptionQuestionCRecord
                                                            ?.isTrue,
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 5.0),
                                              child: StreamBuilder<
                                                  List<QuestionDRecord>>(
                                                stream: queryQuestionDRecord(
                                                  parent: pageViewQuizRecord
                                                      .reference,
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return const Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            Color(0xFF551199),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<QuestionDRecord>
                                                      quizOptionQuestionDRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final quizOptionQuestionDRecord =
                                                      quizOptionQuestionDRecordList
                                                              .isNotEmpty
                                                          ? quizOptionQuestionDRecordList
                                                              .first
                                                          : null;
                                                  return QuizOptionWidget(
                                                    key: Key(
                                                        'Keyxrc_${pageViewIndex}_of_${pageViewQuizRecordList.length}'),
                                                    questionName:
                                                        quizOptionQuestionDRecord
                                                            ?.question,
                                                    isTrue:
                                                        quizOptionQuestionDRecord
                                                            ?.isTrue,
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 16.0),
                              child: smooth_page_indicator.SmoothPageIndicator(
                                controller: _model.pageViewController ??=
                                    PageController(
                                        initialPage: min(0,
                                            pageViewQuizRecordList.length - 1)),
                                count: pageViewQuizRecordList.length,
                                axisDirection: Axis.horizontal,
                                onDotClicked: (i) async {
                                  await _model.pageViewController!
                                      .animateToPage(
                                    i,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                                effect:
                                    smooth_page_indicator.ExpandingDotsEffect(
                                  expansionFactor: 3.0,
                                  spacing: 8.0,
                                  radius: 16.0,
                                  dotWidth: 16.0,
                                  dotHeight: 8.0,
                                  dotColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  activeDotColor:
                                      FlutterFlowTheme.of(context).primary,
                                  paintStyle: PaintingStyle.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 5.0, 32.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await _model.pageViewController?.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                          setState(() {
                            _model.pageNavigate = _model.pageNavigate + -1;
                          });
                        },
                        text: FFLocalizations.of(context).getText(
                          'ysdka5cj' /* Back */,
                        ),
                        options: FFButtonOptions(
                          width: 100.0,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: Colors.white,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 32.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await _model.pageViewController?.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          'qa7ndau6' /* Next */,
                        ),
                        options: FFButtonOptions(
                          width: 100.0,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: Colors.white,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 32.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed(
                            'assessmentResults',
                            queryParameters: {
                              'scoreAchieved': serializeParam(
                                FFAppState().totalscore,
                                ParamType.int,
                              ),
                              'totalQuestions': serializeParam(
                                FFAppState().totalscore,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );

                          FFAppState().update(() {
                            FFAppState().completedQuestions = 0;
                          });
                        },
                        text: FFLocalizations.of(context).getText(
                          'itbedkbn' /* Complete */,
                        ),
                        options: FFButtonOptions(
                          width: 100.0,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: Colors.white,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
