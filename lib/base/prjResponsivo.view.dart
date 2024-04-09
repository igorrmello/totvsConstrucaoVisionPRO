import 'package:flutter/material.dart';

class Responsivo {
  static const double _larguraReferencia = 360;

  static double? textScaleFactor;
  static double? alturaStatusBar;
  static double? larguraTela;
  static double? alturaTela;
  static double? alturaToolbar;
  static double? alturaMenuTabs;
  static double? alturaUtil;
  static double? metadeAltura;

  static double? tresQuartosLargura;
  static double? doisTercosLargura;
  static double? metadeLargura;
  static double? umTercoLargura;
  static double? umQuartoLargura;
  static double? umQuintoLargura;
  static double? umDecimoLargura;

  Responsivo(BuildContext context) {
    setarDimensoes(context);
  }

  void setarDimensoes(BuildContext context) {
    //textScaleFactor = MediaQuery.of(context).textScaler.scale(1);
    alturaStatusBar = MediaQuery.of(context).padding.top;
    larguraTela = MediaQuery.of(context).size.width;
    alturaTela = MediaQuery.of(context).size.height - alturaStatusBar!;
    alturaToolbar = (alturaTela! * 0.12);
    alturaMenuTabs = 0;
    //alturaTela * 0.08;
    //alturaUtil = alturaTela - alturaToolbar - alturaMenuTabs;
    metadeAltura = alturaTela! * 0.5;

    tresQuartosLargura = larguraTela! * 0.75;
    doisTercosLargura = larguraTela! * 0.66;
    metadeLargura = larguraTela! / 2;
    umTercoLargura = larguraTela! / 3;
    umQuartoLargura = larguraTela! / 4;
    umQuintoLargura = larguraTela! / 5;
    umDecimoLargura = larguraTela! / 10;
  }

  // static double fracaoAlturaUtil(double percentual) {
  //   return alturaUtil * (percentual / 100);
  // }

  static double fracaoAlturaTela(double percentual) {
    return alturaTela! * (percentual / 100);
  }

  static double fracaoLarguraTela(double percentual) {
    return larguraTela! * (percentual / 100);
  }

  static double fonte(double tamanho, {bool arredondar = false}) {
    double res = tamanho * (larguraTela! / _larguraReferencia);

    if (arredondar) {
      res = double.parse(res.toStringAsFixed(0));
    }

    return res;
  }
}
