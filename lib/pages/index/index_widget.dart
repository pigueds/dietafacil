import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'index_model.dart';
export 'index_model.dart';

class IndexWidget extends StatefulWidget {
  const IndexWidget({super.key});

  static String routeName = 'index';
  static String routePath = '/index';

  @override
  State<IndexWidget> createState() => _IndexWidgetState();
}

class _IndexWidgetState extends State<IndexWidget> {
  late IndexModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IndexModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'index'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.verificaAssinatura = await VerificaAssinaturaCall.call(
        assinaturaId: valueOrDefault(currentUserDocument?.aSSINATURAId, ''),
      );

      await currentUserReference!.update(createUsersRecordData(
        statusPlano: getJsonField(
          (_model.verificaAssinatura?.jsonBody ?? ''),
          r'''$.status''',
        ).toString().toString(),
      ));
      FFAppState().userPREMIUM =
          valueOrDefault(currentUserDocument?.statusPlano, '') == 'active';
      safeSetState(() {});
      // baixando base de dados
      FFAppState().stateNome = currentUserDisplayName;
      FFAppState().statePeso = valueOrDefault(currentUserDocument?.peso, 0.0);
      FFAppState().stateAltura =
          valueOrDefault(currentUserDocument?.altura, 0.0);
      FFAppState().stateIdade = valueOrDefault(currentUserDocument?.idade, 0.0);
      FFAppState().stateNIVELatividade =
          valueOrDefault(currentUserDocument?.nivelatividade, '');
      FFAppState().stateGENERO =
          valueOrDefault(currentUserDocument?.genero, '');
      FFAppState().stateOBJETIVO =
          valueOrDefault(currentUserDocument?.objetivo, '');
      FFAppState().numeroREFEICOESdia =
          valueOrDefault(currentUserDocument?.numRefeicoes, 0.0);
      FFAppState().horatreino =
          valueOrDefault(currentUserDocument?.horaTreino, '');
      safeSetState(() {});
      if ((FFAppState().stateNome != null && FFAppState().stateNome != '') &&
              (FFAppState().statePeso != null) &&
              (FFAppState().stateAltura != null) &&
              (FFAppState().stateFatorAtividade != null) &&
              (FFAppState().stateIdade != null) &&
              (FFAppState().stateOBJETIVO != null &&
                  FFAppState().stateOBJETIVO != '') &&
              (FFAppState().stateGENERO != null &&
                  FFAppState().stateGENERO != '')
          ? true
          : false) {
        context.pushNamed(DadosDoUsuarioShowWidget.routeName);
      } else {
        context.pushNamed(DadosDoUsuarioWidget.routeName);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: true,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.safePop();
            },
            child: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).secondary,
              size: 30.0,
            ),
          ),
          title: Text(
            'Dieta Fácil',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.readexPro(
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).secondary,
                  fontSize: 30.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: MenuWidget(),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                },
                child: Icon(
                  Icons.menu,
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 30.0,
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Lottie.asset(
                  'assets/jsons/Animation_-_1743952982285.json',
                  width: 150.0,
                  height: 150.0,
                  fit: BoxFit.contain,
                  reverse: true,
                  animate: true,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                  child: AnimatedDefaultTextStyle(
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    duration: Duration(milliseconds: 285),
                    curve: Curves.elasticOut,
                    child: Text(
                      'Carregando...',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
