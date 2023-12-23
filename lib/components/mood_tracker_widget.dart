import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mood_tracker_model.dart';
export 'mood_tracker_model.dart';

class MoodTrackerWidget extends StatefulWidget {
  const MoodTrackerWidget({super.key});

  @override
  _MoodTrackerWidgetState createState() => _MoodTrackerWidgetState();
}

class _MoodTrackerWidgetState extends State<MoodTrackerWidget>
    with TickerProviderStateMixin {
  late MoodTrackerModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(0.698, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodTrackerModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 24.0),
      child: Container(
        width: double.infinity,
        height: 900.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 1.0),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 15.0, 0.0, 25.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.updatePage(() {
                                      FFAppState().yesterdaysDate =
                                          functions.todaysDate()!;
                                    });
                                    context.safePop();
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 30.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'pc5xijws' /* Mood Tracker */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .headlineSmallFamily,
                                        fontSize: 24.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmallFamily),
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'tugn3osn' /* Below is an overview of your d... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        fontSize: 14.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 600.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: const Alignment(0.0, 0),
                          child: TabBar(
                            labelColor:
                                FlutterFlowTheme.of(context).primaryText,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            labelStyle:
                                FlutterFlowTheme.of(context).titleMedium,
                            unselectedLabelStyle: const TextStyle(),
                            indicatorColor:
                                FlutterFlowTheme.of(context).primary,
                            padding: const EdgeInsets.all(4.0),
                            tabs: [
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  'cb5hyolu' /* Day */,
                                ),
                              ),
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  'zndq3smh' /* Week */,
                                ),
                              ),
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  '810uplaa' /* Month */,
                                ),
                              ),
                            ],
                            controller: _model.tabBarController,
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 20.0, 16.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 300.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: SizedBox(
                                              width: 510.0,
                                              height: 700.0,
                                              child: FlutterFlowBarChart(
                                                barData: [
                                                  FFBarChartData(
                                                    yData: FFAppState().mood,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    borderWidth: 2.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                  )
                                                ],
                                                xLabels: FFAppState().date,
                                                barWidth: 16.0,
                                                barBorderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(8.0),
                                                  topRight:
                                                      Radius.circular(8.0),
                                                ),
                                                groupSpace: 8.0,
                                                alignment: BarChartAlignment
                                                    .spaceAround,
                                                chartStylingInfo:
                                                    ChartStylingInfo(
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  showGrid: true,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderWidth: 1.0,
                                                ),
                                                axisBounds: const AxisBounds(),
                                                xAxisLabelInfo: const AxisLabelInfo(),
                                                yAxisLabelInfo: const AxisLabelInfo(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 3.0,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (!FFAppState()
                                                          .date
                                                          .contains(functions
                                                              .date2Date())) {
                                                        setState(() {
                                                          FFAppState()
                                                              .addToMood(5);
                                                          FFAppState().addToDate(
                                                              functions
                                                                  .date2Date()!);
                                                        });
                                                        if (functions
                                                                .todaysDate() !=
                                                            (FFAppState()
                                                                    .yesterdaysDate +
                                                                1)) {
                                                          setState(() {
                                                            FFAppState()
                                                                    .streak =
                                                                FFAppState()
                                                                        .streak +
                                                                    1;
                                                          });
                                                        }
                                                        if (FFAppState()
                                                                .streak ==
                                                            7) {
                                                          setState(() {
                                                            FFAppState()
                                                                    .credit =
                                                                FFAppState()
                                                                        .credit +
                                                                    5;
                                                          });
                                                        }
                                                      }
                                                    },
                                                    child: const FaIcon(
                                                      FontAwesomeIcons
                                                          .solidLaugh,
                                                      color: Color(0xFF00FF73),
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (!FFAppState()
                                                          .date
                                                          .contains(functions
                                                              .date2Date())) {
                                                        setState(() {
                                                          FFAppState()
                                                              .addToMood(4);
                                                          FFAppState().addToDate(
                                                              functions
                                                                  .date2Date()!);
                                                        });
                                                        if (functions
                                                                .todaysDate() !=
                                                            (FFAppState()
                                                                    .yesterdaysDate +
                                                                1)) {
                                                          setState(() {
                                                            FFAppState()
                                                                    .streak =
                                                                FFAppState()
                                                                        .streak +
                                                                    1;
                                                          });
                                                        }
                                                      }
                                                    },
                                                    child: const FaIcon(
                                                      FontAwesomeIcons
                                                          .solidSmile,
                                                      color: Color(0xFF77FF00),
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (!FFAppState()
                                                          .date
                                                          .contains(functions
                                                              .date2Date())) {
                                                        setState(() {
                                                          FFAppState()
                                                              .addToMood(3);
                                                          FFAppState().addToDate(
                                                              functions
                                                                  .date2Date()!);
                                                        });
                                                        if (functions
                                                                .todaysDate() !=
                                                            (FFAppState()
                                                                    .yesterdaysDate +
                                                                1)) {
                                                          setState(() {
                                                            FFAppState()
                                                                    .streak =
                                                                FFAppState()
                                                                        .streak +
                                                                    1;
                                                          });
                                                        }
                                                      }
                                                    },
                                                    child: Icon(
                                                      Icons
                                                          .sentiment_neutral_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warning,
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (!FFAppState()
                                                          .date
                                                          .contains(functions
                                                              .date2Date())) {
                                                        setState(() {
                                                          FFAppState()
                                                              .addToMood(2);
                                                          FFAppState().addToDate(
                                                              functions
                                                                  .date2Date()!);
                                                        });
                                                        if (functions
                                                                .todaysDate() !=
                                                            (FFAppState()
                                                                    .yesterdaysDate +
                                                                1)) {
                                                          setState(() {
                                                            FFAppState()
                                                                    .streak =
                                                                FFAppState()
                                                                        .streak +
                                                                    1;
                                                          });
                                                        }
                                                      }
                                                    },
                                                    child: const FaIcon(
                                                      FontAwesomeIcons
                                                          .solidSadTear,
                                                      color: Color(0xFFFF6C00),
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (!FFAppState()
                                                          .date
                                                          .contains(functions
                                                              .date2Date())) {
                                                        setState(() {
                                                          FFAppState()
                                                              .addToMood(1);
                                                          FFAppState().addToDate(
                                                              functions
                                                                  .date2Date()!);
                                                        });
                                                        if (functions
                                                                .todaysDate() !=
                                                            (FFAppState()
                                                                    .yesterdaysDate +
                                                                1)) {
                                                          setState(() {
                                                            FFAppState()
                                                                    .streak =
                                                                FFAppState()
                                                                        .streak +
                                                                    1;
                                                          });
                                                        }
                                                      }
                                                    },
                                                    child: FaIcon(
                                                      FontAwesomeIcons
                                                          .solidAngry,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () async {
                                                FFAppState().update(() {
                                                  FFAppState().mood = [];
                                                  FFAppState().date = [];
                                                  FFAppState().streak = 6;
                                                });
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'hzifktvi' /* Clear */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                elevation: 3.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 20.0, 16.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 300.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: SizedBox(
                                              width: 510.0,
                                              height: 700.0,
                                              child: FlutterFlowBarChart(
                                                barData: [
                                                  FFBarChartData(
                                                    yData: FFAppState().mood,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    borderWidth: 2.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                  )
                                                ],
                                                xLabels: FFAppState().date,
                                                barWidth: 16.0,
                                                barBorderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(8.0),
                                                  topRight:
                                                      Radius.circular(8.0),
                                                ),
                                                groupSpace: 8.0,
                                                alignment: BarChartAlignment
                                                    .spaceAround,
                                                chartStylingInfo:
                                                    ChartStylingInfo(
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  showGrid: true,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderWidth: 1.0,
                                                ),
                                                axisBounds: const AxisBounds(),
                                                xAxisLabelInfo: const AxisLabelInfo(),
                                                yAxisLabelInfo: const AxisLabelInfo(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 3.0,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 8.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  _model.weeksum?.toString(),
                                                  '0',
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (!FFAppState()
                                                          .date
                                                          .contains(functions
                                                              .date2Date())) {
                                                        setState(() {
                                                          FFAppState()
                                                              .addToMood(5);
                                                          FFAppState().addToDate(
                                                              functions
                                                                  .date2Date()!);
                                                        });
                                                      }
                                                    },
                                                    child: const FaIcon(
                                                      FontAwesomeIcons
                                                          .solidLaugh,
                                                      color: Color(0xFF00FF73),
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (!FFAppState()
                                                          .date
                                                          .contains(functions
                                                              .date2Date())) {
                                                        setState(() {
                                                          FFAppState()
                                                              .addToMood(4);
                                                          FFAppState().addToDate(
                                                              functions
                                                                  .date2Date()!);
                                                        });
                                                      }
                                                    },
                                                    child: const FaIcon(
                                                      FontAwesomeIcons
                                                          .solidSmile,
                                                      color: Color(0xFF77FF00),
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (!FFAppState()
                                                          .date
                                                          .contains(functions
                                                              .date2Date())) {
                                                        setState(() {
                                                          FFAppState()
                                                              .addToMood(3);
                                                          FFAppState().addToDate(
                                                              functions
                                                                  .date2Date()!);
                                                        });
                                                      }
                                                    },
                                                    child: Icon(
                                                      Icons
                                                          .sentiment_neutral_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warning,
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (!FFAppState()
                                                          .date
                                                          .contains(functions
                                                              .date2Date())) {
                                                        setState(() {
                                                          FFAppState()
                                                              .addToMood(2);
                                                          FFAppState().addToDate(
                                                              functions
                                                                  .date2Date()!);
                                                        });
                                                      }
                                                    },
                                                    child: const FaIcon(
                                                      FontAwesomeIcons
                                                          .solidSadTear,
                                                      color: Color(0xFFFF6C00),
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (!FFAppState()
                                                          .date
                                                          .contains(functions
                                                              .date2Date())) {
                                                        setState(() {
                                                          FFAppState()
                                                              .addToMood(1);
                                                          FFAppState().addToDate(
                                                              functions
                                                                  .date2Date()!);
                                                        });
                                                      }
                                                    },
                                                    child: FaIcon(
                                                      FontAwesomeIcons
                                                          .solidAngry,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () async {
                                                _model.weeksum =
                                                    await actions.addList();

                                                setState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'fw44ft0e' /* Analyze Overall Mood */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                elevation: 3.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                setState(() {
                                                  FFAppState().mood = [];
                                                  FFAppState().date = [];
                                                });
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'bjn99ufo' /* Clear */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                elevation: 3.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 20.0, 16.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 300.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: SizedBox(
                                              width: 510.0,
                                              height: 700.0,
                                              child: FlutterFlowBarChart(
                                                barData: [
                                                  FFBarChartData(
                                                    yData: FFAppState().mood,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    borderWidth: 2.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                  )
                                                ],
                                                xLabels: FFAppState().date,
                                                barWidth: 16.0,
                                                barBorderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(8.0),
                                                  topRight:
                                                      Radius.circular(8.0),
                                                ),
                                                groupSpace: 8.0,
                                                alignment: BarChartAlignment
                                                    .spaceAround,
                                                chartStylingInfo:
                                                    ChartStylingInfo(
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  showGrid: true,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderWidth: 1.0,
                                                ),
                                                axisBounds: const AxisBounds(),
                                                xAxisLabelInfo: const AxisLabelInfo(),
                                                yAxisLabelInfo: const AxisLabelInfo(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 3.0,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 8.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  _model.monthsum?.toString(),
                                                  '0',
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (!FFAppState()
                                                          .date
                                                          .contains(functions
                                                              .date2Date())) {
                                                        setState(() {
                                                          FFAppState()
                                                              .addToMood(5);
                                                          FFAppState().addToDate(
                                                              functions
                                                                  .date2Date()!);
                                                        });
                                                      }
                                                    },
                                                    child: const FaIcon(
                                                      FontAwesomeIcons
                                                          .solidLaugh,
                                                      color: Color(0xFF00FF73),
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (!FFAppState()
                                                          .date
                                                          .contains(functions
                                                              .date2Date())) {
                                                        setState(() {
                                                          FFAppState()
                                                              .addToMood(4);
                                                          FFAppState().addToDate(
                                                              functions
                                                                  .date2Date()!);
                                                        });
                                                      }
                                                    },
                                                    child: const FaIcon(
                                                      FontAwesomeIcons
                                                          .solidSmile,
                                                      color: Color(0xFF77FF00),
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (!FFAppState()
                                                          .date
                                                          .contains(functions
                                                              .date2Date())) {
                                                        setState(() {
                                                          FFAppState()
                                                              .addToMood(3);
                                                          FFAppState().addToDate(
                                                              functions
                                                                  .date2Date()!);
                                                        });
                                                      }
                                                    },
                                                    child: Icon(
                                                      Icons
                                                          .sentiment_neutral_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warning,
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (!FFAppState()
                                                          .date
                                                          .contains(functions
                                                              .date2Date())) {
                                                        setState(() {
                                                          FFAppState()
                                                              .addToMood(2);
                                                          FFAppState().addToDate(
                                                              functions
                                                                  .date2Date()!);
                                                        });
                                                      }
                                                    },
                                                    child: const FaIcon(
                                                      FontAwesomeIcons
                                                          .solidSadTear,
                                                      color: Color(0xFFFF6C00),
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (!FFAppState()
                                                          .date
                                                          .contains(functions
                                                              .date2Date())) {
                                                        setState(() {
                                                          FFAppState()
                                                              .addToMood(1);
                                                          FFAppState().addToDate(
                                                              functions
                                                                  .date2Date()!);
                                                        });
                                                      }
                                                    },
                                                    child: FaIcon(
                                                      FontAwesomeIcons
                                                          .solidAngry,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () async {
                                                _model.monthsum =
                                                    await actions.addList();

                                                setState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'rtvaof7h' /* Analyze Overall Mood */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                elevation: 3.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                setState(() {
                                                  FFAppState().mood = [];
                                                  FFAppState().date = [];
                                                });
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'ol6p2cl5' /* Clear */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                elevation: 3.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
