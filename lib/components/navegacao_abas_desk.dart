// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:facebook_interface/components/botao_circulo.dart';
import 'package:facebook_interface/components/botao_imagem_perfil.dart';
import 'package:facebook_interface/models/modelos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:facebook_interface/components/navegacao_abas.dart';
import 'package:line_icons/line_icons.dart';

import '../util/paleta_cores.dart';

class NavegacaoAbasDesk extends StatelessWidget {
  final Usuario usuario;
  final List<IconData> icones;
  final int indiceAbaSel;
  final Function(int) onTap;
  const NavegacaoAbasDesk({
    Key? key,
    required this.usuario,
    required this.icones,
    required this.indiceAbaSel,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 65,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 4)
        ]),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "Facebook",
                style: TextStyle(
                    color: PaletaCores.azulFacebook,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    letterSpacing: -1.2),
              ),
            ),
            Expanded(
              child: NavegacaoAbas(
                icones: icones,
                indiceAbaSel: indiceAbaSel,
                onTap: onTap,
                indicadorEmbaixo: true,
              ),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BotaoImagemPerfil(
                  usuario: usuario,
                  onTap: () {},
                ),
                BotaoCirculo(
                  icone: Icons.search,
                  iconeTamanho: 30,
                  onPressed: () {},
                ),
                BotaoCirculo(
                  icone: LineIcons.facebookMessenger,
                  iconeTamanho: 30,
                  onPressed: () {},
                )
              ],
            )),
          ],
        ));
  }
}
