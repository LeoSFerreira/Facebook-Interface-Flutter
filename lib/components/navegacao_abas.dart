// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:facebook_interface/util/paleta_cores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavegacaoAbas extends StatelessWidget {
  final List<IconData> icones;
  final int indiceAbaSel;
  final Function(int) onTap;
  final bool indicadorEmbaixo;
  const NavegacaoAbas({
    Key? key,
    required this.icones,
    required this.indiceAbaSel,
    required this.onTap,
    this.indicadorEmbaixo = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
        onTap: onTap,
        indicator: BoxDecoration(
            border: indicadorEmbaixo
                ? Border(
                    bottom:
                        BorderSide(color: PaletaCores.azulFacebook, width: 3),
                  )
                : Border(
                    top: BorderSide(color: PaletaCores.azulFacebook, width: 3),
                  )),
        tabs: icones
            .asMap()
            .map((i, icone) {
              return MapEntry(
                  i,
                  Tab(
                    icon: Icon(
                      icone,
                      color: indiceAbaSel == i
                          ? PaletaCores.azulFacebook
                          : Colors.black,
                      size: 30,
                    ),
                  ));
            })
            .values
            .toList());
  }
}
