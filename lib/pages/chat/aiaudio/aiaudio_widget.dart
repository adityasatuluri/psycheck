import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'aiaudio_model.dart';
export 'aiaudio_model.dart';

class AiaudioWidget extends StatefulWidget {
  const AiaudioWidget({super.key});

  @override
  _AiaudioWidgetState createState() => _AiaudioWidgetState();
}

class _AiaudioWidgetState extends State<AiaudioWidget>
    with TickerProviderStateMixin {
  late AiaudioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AiaudioModel());

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
        body: Align(
          alignment: const AlignmentDirectional(0.0, -1.0),
          child: SizedBox(
            height: 750.0,
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 56.0),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (_model.showWaveform)
                            Lottie.asset(
                              'assets/lottie_animations/Audio_Wave.json',
                              width: 400.0,
                              height: 100.0,
                              fit: BoxFit.fill,
                              animate: true,
                            ),
                          if (_model.showWaveform)
                            FlutterFlowTimer(
                              initialTime: FFAppState().timerValue,
                              getDisplayTime: (value) =>
                                  StopWatchTimer.getDisplayTime(
                                value,
                                hours: false,
                                minute: false,
                                milliSecond: false,
                              ),
                              controller: _model.timerController,
                              updateStateInterval: const Duration(milliseconds: 1000),
                              onChanged: (value, displayTime, shouldUpdate) {
                                _model.timerMilliseconds = value;
                                _model.timerValue = displayTime;
                                if (shouldUpdate) setState(() {});
                              },
                              onEnded: () async {
                                _model.timerController.onResetTimer();

                                setState(() {
                                  _model.showWaveform = false;
                                });
                              },
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .headlineSmallFamily,
                                    color: const Color(0x00FFFFFF),
                                    fontSize: 2.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .headlineSmallFamily),
                                  ),
                            ),
                          if (_model.showWaveform)
                            Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!_model.isRecording)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 100.0,
                                        buttonSize: 150.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        icon: Icon(
                                          Icons.mic_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 60.0,
                                        ),
                                        showLoadingIndicator: true,
                                        onPressed: () async {
                                          setState(() {
                                            _model.isRecording = true;
                                          });
                                          unawaited(
                                            () async {
                                              await actions
                                                  .startTextRecording();
                                            }(),
                                          );
                                        },
                                      ),
                                    ),
                                  if (_model.isRecording)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 100.0,
                                        buttonSize: 150.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        icon: Icon(
                                          Icons.stop_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 60.0,
                                        ),
                                        showLoadingIndicator: true,
                                        onPressed: () async {
                                          setState(() {
                                            _model.isRecording = false;
                                          });
                                          await actions.stopTextRecording();
                                          _model.getResponseAPICall =
                                              await GetResponseCall.call(
                                            apiKeyAuth: FFAppState().apiKey,
                                            prompt: FFAppState()
                                                .speechToTextResponse,
                                            language:
                                                FFLocalizations.of(context)
                                                    .languageCode,
                                          );
                                          if ((_model.getResponseAPICall
                                                  ?.succeeded ??
                                              true)) {
                                            _model.speechOutput = await actions
                                                .fetchSpeechAndPlay(
                                              getJsonField(
                                                (_model.getResponseAPICall
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.choices[:].message.content''',
                                              ).toString(),
                                              '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',
                                            );
                                            setState(() {
                                              FFAppState().timerValue =
                                                  _model.speechOutput!;
                                              FFAppState()
                                                  .speechToTextResponse = '';
                                            });
                                            setState(() {
                                              _model.showWaveform = true;
                                            });
                                            await Future.delayed(const Duration(
                                                milliseconds: 100));
                                            _model.timerController
                                                .onStartTimer();
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Failed',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                          }

                                          setState(() {});
                                        },
                                      ),
                                    ),
                                ],
                              ).animateOnPageLoad(
                                  animationsMap['columnOnPageLoadAnimation']!),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                    child: FlutterFlowLanguageSelector(
                      width: 200.0,
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      borderColor: FlutterFlowTheme.of(context).primary,
                      dropdownIconColor: Colors.white,
                      borderRadius: 8.0,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily: 'Outfit',
                            fontSize: 12.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                      hideFlags: true,
                      flagSize: 24.0,
                      flagTextGap: 8.0,
                      currentLanguage: FFLocalizations.of(context).languageCode,
                      languages: FFLocalizations.languages(),
                      onChanged: (lang) => setAppLanguage(context, lang),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
