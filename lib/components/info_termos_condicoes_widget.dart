import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'info_termos_condicoes_model.dart';
export 'info_termos_condicoes_model.dart';

class InfoTermosCondicoesWidget extends StatefulWidget {
  const InfoTermosCondicoesWidget({super.key});

  @override
  State<InfoTermosCondicoesWidget> createState() =>
      _InfoTermosCondicoesWidgetState();
}

class _InfoTermosCondicoesWidgetState extends State<InfoTermosCondicoesWidget> {
  late InfoTermosCondicoesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InfoTermosCondicoesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 382.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Text(
                        'Termos e Condições de Uso',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              font: GoogleFonts.outfit(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  '\nBem-vindo ao Dieta Fácil! Ao utilizar nosso aplicativo, você concorda com os seguintes Termos e Condições de Uso e com nossa Política de Privacidade. Por favor, leia atentamente antes de prosseguir. Se você não concordar com qualquer parte destes termos, não utilize o aplicativo.\n\n1. Aceitação dos Termos\n\nAo acessar e utilizar o Dieta Fácil, você confirma que leu, compreendeu e concorda com estes Termos e Condições, bem como com nossa Política de Privacidade. Se você não concordar com qualquer parte destes termos, você não está autorizado a usar o aplicativo.\n\n2. Objetivo do Aplicativo\n\nO Dieta Fácil é uma ferramenta desenvolvida para calcular o metabolismo basal e a quantidade de calorias diárias que um usuário pode necessitar, com base em informações como peso, idade, altura e sexo. Com base nesses cálculos, o aplicativo fornece exemplos de dietas que podem ser úteis como referência. Esses exemplos são meramente ilustrativos e não substituem a orientação de um profissional de nutrição qualificado.\n3. Aviso Importante\n\nO Dieta Fácil não fornece dietas personalizadas ou prescrições nutricionais. As informações geradas pelo aplicativo são apenas exemplos de dietas com base em cálculos de necessidades calóricas. O aplicativo não tem a intenção de diagnosticar, tratar, curar ou prevenir qualquer doença ou condição de saúde.\n\n4. Consulta com um Nutricionista\n\nRecomendamos enfaticamente que todos os usuários consultem um nutricionista registrado antes de iniciar qualquer nova dieta. Isso é especialmente importante se você tiver alguma condição de saúde pré-existente, como diabetes, hipertensão, alergias alimentares (como ao glúten ou à proteína do leite), ou qualquer outra condição médica que possa ser afetada por mudanças na dieta.\n\n5. Responsabilidade do Usuário\n\nAo utilizar o Dieta Fácil, você assume total responsabilidade por qualquer decisão tomada com base nas informações fornecidas pelo aplicativo. O Dieta Fácil não se responsabiliza por quaisquer consequências decorrentes do uso ou má interpretação dos exemplos de dietas sugeridos.\n\n6. Limitações do Aplicativo\n\nO Dieta Fácil utiliza um modelo matemático para calcular o metabolismo basal e as necessidades calóricas diárias com base em informações como peso, idade, altura e sexo. No entanto, o aplicativo não leva em consideração todas as variáveis individuais que um nutricionista consideraria em uma consulta presencial. Portanto, os exemplos de dietas gerados podem não ser adequados para todas as pessoas.\n\n7. Isenção de Responsabilidade\n\nO Dieta Fácil e seus desenvolvedores não são responsáveis por quaisquer danos, diretos ou indiretos, que possam resultar do uso das informações fornecidas pelo aplicativo. Isso inclui, mas não se limita a, danos físicos, emocionais ou financeiros.\n\n8. Política de Privacidade\n\nO Dieta Fácil está comprometido com a proteção dos dados pessoais dos usuários, em conformidade com a Lei Geral de Proteção de Dados (LGPD - Lei nº 13.709/2018). Esta seção explica como coletamos, usamos, armazenamos e protegemos suas informações.\n\n8.1. Dados Coletados\n\nColetamos os seguintes tipos de dados:\n\n    Dados de cadastro: nome, e-mail, idade, sexo, peso, altura e objetivos de saúde.\n\n    Dados de uso: informações sobre como você interage com o aplicativo, como preferências alimentares e histórico de cálculos realizados.\n\n    Dados técnicos: endereço IP, tipo de dispositivo, sistema operacional e dados de localização (se permitido pelo usuário).\n\n8.2. Finalidade do Uso dos Dados\n\nSeus dados são utilizados para:\n\n    Calcular o metabolismo basal e as necessidades calóricas diárias;\n\n    Fornecer exemplos de dietas com base nas informações fornecidas;\n\n    Melhorar a funcionalidade e a experiência do usuário no aplicativo;\n\n    Enviar comunicações relevantes sobre o aplicativo (se você optar por recebê-las);\n\n    Cumprir obrigações legais e regulatórias.\n\n8.3. Compartilhamento de Dados\n\nSeus dados pessoais não serão compartilhados com terceiros sem o seu consentimento explícito, exceto nas seguintes situações:\n\n    Quando exigido por lei ou por autoridades competentes;\n\n    Para cumprir obrigações contratuais com parceiros técnicos (como hospedagem de dados), que estão sujeitos a contratos de confidencialidade.\n\n8.4. Direitos do Usuário\n\nDe acordo com a LGPD, você tem o direito de:\n\n    Acessar seus dados pessoais;\n\n    Corrigir dados incompletos, inexatos ou desatualizados;\n\n    Solicitar a exclusão de seus dados (exceto quando a retenção for necessária por lei);\n\n    Revogar o consentimento para o uso de seus dados;\n\n    Solicitar a portabilidade de seus dados para outro serviço ou produto.\n\nPara exercer esses direitos, entre em contato conosco através do e-mail [seu e-mail de contato].\n\n8.5. Segurança dos Dados\n\nImplementamos medidas técnicas e organizacionais para proteger seus dados contra acessos não autorizados, alterações, divulgação ou destruição. Isso inclui:\n\n    Criptografia de dados;\n\n    Acesso restrito a informações sensíveis;\n\n    Monitoramento contínuo de segurança.\n\nNo entanto, nenhum sistema de segurança é infalível, e não podemos garantir a segurança absoluta dos dados.\n\n8.6. Retenção de Dados\n\nSeus dados serão armazenados apenas pelo tempo necessário para cumprir as finalidades descritas nesta política ou para atender a obrigações legais. Após esse período, os dados serão excluídos ou anonimizados.\n\n8.7. Menores de Idade\n\nO Dieta Fácil não coleta dados de menores de 18 anos sem o consentimento dos pais ou responsáveis legais. Se tomarmos conhecimento de que coletamos dados de um menor sem consentimento, tais dados serão excluídos imediatamente.\n9. Propriedade Intelectual\n\nTodo o conteúdo disponível no Dieta Fácil, incluindo textos, gráficos, logotipos, ícones, imagens, clipes de áudio e software, é propriedade do Dieta Fácil ou de seus licenciadores e está protegido por leis de direitos autorais e propriedade intelectual. Você concorda em não reproduzir, distribuir, modificar ou criar obras derivadas desse conteúdo sem a permissão expressa do Dieta Fácil.\n\n10. Uso Adequado\n\nVocê concorda em usar o Dieta Fácil apenas para fins legais e de maneira que não viole os direitos de terceiros ou restrinja ou iniba o uso e aproveitamento do aplicativo por qualquer outra pessoa. O uso inadequado inclui, mas não se limita a, tentativas de acessar dados não autorizados, interferir no funcionamento do aplicativo ou usar o aplicativo para atividades ilegais.\n\n11. Alterações nos Termos e Condições\n\nReservamos o direito de modificar estes Termos e Condições e a Política de Privacidade a qualquer momento. Quaisquer alterações serão publicadas nesta página, e o uso contínuo do aplicativo após tais mudanças constitui sua aceitação dos novos termos.\n\n12. Rescisão\n\nReservamos o direito de rescindir ou suspender seu acesso ao Dieta Fácil, sem aviso prévio, por qualquer motivo, incluindo, mas não se limitando a, violação destes Termos e Condições.\n\n13. Lei Aplicável\n\nEstes Termos e Condições são regidos e interpretados de acordo com as leis da República Federativa do Brasil. Qualquer disputa relacionada a estes termos será submetida à jurisdição exclusiva dos tribunais da cidade de [sua cidade], estado de [seu estado].\n\n14. Disposições Gerais\n\nSe qualquer disposição destes Termos e Condições for considerada inválida ou inexequível por um tribunal de jurisdição competente, as demais disposições permanecerão em pleno vigor e efeito.\n\n15. Contato\n\nSe você tiver alguma dúvida ou preocupação sobre estes Termos e Condições ou nossa Política de Privacidade, por favor, entre em contato conosco através do e-mail [seu e-mail de contato].\n\nAviso Final:\nLembre-se, sua saúde é importante. Consulte sempre um nutricionista antes de fazer mudanças significativas em sua dieta. Além disso, garantimos que seus dados pessoais estão protegidos e serão tratados com total transparência e segurança, em conformidade com a LGPD.',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.readexPro(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
