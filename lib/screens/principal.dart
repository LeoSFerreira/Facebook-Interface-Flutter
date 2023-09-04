import 'package:facebook_interface/components/navegacao_abas.dart';
import 'package:facebook_interface/components/navegacao_abas_desk.dart';
import 'package:facebook_interface/data/dados.dart';
import 'package:facebook_interface/screens/home.dart';
import 'package:facebook_interface/util/responsivo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final List<Widget> _telas = [
    Home(),
    Scaffold(
      backgroundColor: Colors.green,
    ),
    Scaffold(
      backgroundColor: Colors.yellow,
    ),
    Scaffold(
      backgroundColor: Colors.purple,
    ),
    Scaffold(
      backgroundColor: Colors.black54,
    ),
    Scaffold(
      backgroundColor: Colors.orange,
    )
  ];

  List<IconData> _icones = [
    Icons.home,
    Icons.ondemand_video,
    Icons.storefront_outlined,
    Icons.flag_outlined,
    LineIcons.bell,
    Icons.menu
  ];

  int _indiceAbaSel = 0;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsivo.isDesktop(context);
    Size tamanho = MediaQuery.of(context).size;

    return DefaultTabController(
        length: _icones.length,
        child: Scaffold(
          appBar: isDesktop
              ? PreferredSize(
                  child: NavegacaoAbasDesk(
                    usuario: usuarioAtual,
                    icones: _icones,
                    indiceAbaSel: _indiceAbaSel,
                    onTap: (indice) {
                      setState(() {
                        _indiceAbaSel = indice;
                      });
                    },
                  ),
                  preferredSize: Size(tamanho.width, 100))
              : null,
          body: TabBarView(
              physics: NeverScrollableScrollPhysics(), children: _telas),
          bottomNavigationBar: isDesktop
              ? null
              : NavegacaoAbas(
                  icones: _icones,
                  indiceAbaSel: _indiceAbaSel,
                  onTap: (indice) {
                    setState(() {
                      _indiceAbaSel = indice;
                    });
                  },
                ),
        ));
  }
}
