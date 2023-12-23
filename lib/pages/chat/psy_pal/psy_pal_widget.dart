import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'psy_pal_model.dart';
export 'psy_pal_model.dart';

class PsyPalWidget extends StatefulWidget {
  const PsyPalWidget({super.key});

  @override
  _PsyPalWidgetState createState() => _PsyPalWidgetState();
}

class _PsyPalWidgetState extends State<PsyPalWidget> {
  late PsyPalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PsyPalModel());

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
              'tpa5qtil' /* PsyPal */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  color: Colors.white,
                  fontSize: 22.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).headlineMediumFamily),
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (Theme.of(context).brightness == Brightness.light)
                        const FlutterFlowWebView(
                          content:
                              '<html>\n  <head>\n  <meta name="viewport" content="width=device-width, initial-scale=1 viewport-fit=cover, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">\n  <style>\n      body {\n        background-color: #101213;\n        margin: 0 auto;\n        display: -ms-flexbox;\n        display: -webkit-flex;\n        display: flex;\n        flex-direction: column;\n        height: 100vh;\n      }\n      #bp-web-widget-container {\n        max-height: 80%;\n        width:420px;\n        margin: auto;\n        flex-grow: 1;\n      }\n      #bp-web-widget-container div {\n        height: 100%;\n      }\n      .webchatIframe {\n        position: relative !important;\n      }\n    </style>\n    <title>PsyPal</title>\n  </head>\n  <body>\n\n  <script src="https://cdn.botpress.cloud/webchat/v1/inject.js"></script>\n<script>\n  window.botpressWebChat.init({\n      "composerPlaceholder": "Chat with PsyPal",\n      "botConversationDescription": "Powered by PsyCheck",\n      "botId": "64230cb3-cf9d-46c1-b1f4-b070938102f6",\n      "hostUrl": "https://cdn.botpress.cloud/webchat/v1",\n      "messagingUrl": "https://messaging.botpress.cloud",\n      "clientId": "64230cb3-cf9d-46c1-b1f4-b070938102f6",\n      "webhookId": "45d80e74-9e8e-4de6-93ca-496207f7d0a1",\n      "stylesheet": "https://webchat-styler-css.botpress.app/prod/c5ce5196-df43-4962-b9c1-4efeda3da643/v99248/style.css",\n      "lazySocket": true,\n      "themeName": "prism",\n      "botName": "PsyPal",\n      "frontendVersion": "v1",\n      "theme": "prism",\n      "themeColor": "#2563eb",\n      "hideWidget": true,\n      "disableAnimations": true,\n      "closeOnEscape": false,\n      "showConversationsButton": false,\n      "enableTranscriptDownload": false,\n      "className": "webchatIframe",\n      "containerWidth": "100%25",\n      "layoutWidth": "100%25",\n      "showCloseButton": false\n  });\nwindow.botpressWebChat.onEvent(function () { window.botpressWebChat.sendEvent({ type: \'show\' }) }, [\'LIFECYCLE.LOADED\']);\n</script>\n\n  </body>\n</html>',
                          height: 620.0,
                          verticalScroll: false,
                          horizontalScroll: false,
                          html: true,
                        ),
                    ],
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
