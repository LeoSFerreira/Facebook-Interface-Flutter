// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:facebook_interface/components/imagem_perfil.dart';
import 'package:flutter/cupertino.dart';

import 'package:facebook_interface/models/modelos.dart';
import 'package:flutter/material.dart';

class BotaoImagemPerfil extends StatelessWidget {
  final Usuario usuario;
  final VoidCallback onTap;
  const BotaoImagemPerfil({
    Key? key,
    required this.usuario,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        ImagemPerfil(
          urlImagem: usuario.urlImagem,
          foiVisualizado: true,
        ),
        SizedBox(
          width: 4,
        ),
        Flexible(
            child: Text(
          usuario.nome,
          style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
        ))
      ]),
    );
  }
}
