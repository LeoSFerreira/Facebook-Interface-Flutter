// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/util/responsivo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:facebook_interface/components/imagem_perfil.dart';
import 'package:facebook_interface/models/modelos.dart';
import 'package:facebook_interface/util/paleta_cores.dart';
import 'package:line_icons/line_icons.dart';

class CartaoPostagem extends StatelessWidget {
  final Postagem postagem;
  const CartaoPostagem({
    Key? key,
    required this.postagem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsivo.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: isDesktop ? 5 : 0),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          : null,
      child: Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              //Cabeçalho
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CabecalhoPostagem(postagem: postagem),
                    Text(postagem.descricao)
                  ],
                ),
              ),

              //Imagem postagem
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: CachedNetworkImage(imageUrl: postagem.urlImagem),
              ),

              //estatísticas postagem
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: EstatisticasPostagem(postagem: postagem),
              )
            ],
          )),
    );
  }
}

class EstatisticasPostagem extends StatelessWidget {
  final Postagem postagem;
  const EstatisticasPostagem({
    Key? key,
    required this.postagem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: PaletaCores.azulFacebook, shape: BoxShape.circle),
              child: Icon(
                Icons.thumb_up,
                color: Colors.white,
                size: 10,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                "${postagem.curtidas}",
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
            Text(
              "${postagem.comentarios} comentários",
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "${postagem.compartilhamentos} compartilhamentos",
              style: TextStyle(color: Colors.grey[700]),
            )
          ],
        ),
        Divider(thickness: 1.2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BotaoPostagem(
                icone: Icon(
                  LineIcons.thumbsUp,
                  color: Colors.grey[700],
                ),
                texto: "Curtir",
                onTap: () {}),
            BotaoPostagem(
                icone: Icon(
                  LineIcons.alternateCommentAlt,
                  color: Colors.grey[700],
                ),
                texto: "Comentar",
                onTap: () {}),
            BotaoPostagem(
                icone: Icon(
                  LineIcons.share,
                  color: Colors.grey[700],
                ),
                texto: "Compartilhar",
                onTap: () {}),
          ],
        )
      ],
    );
  }
}

class BotaoPostagem extends StatelessWidget {
  final Icon icone;
  final String texto;
  final VoidCallback onTap;
  const BotaoPostagem({
    Key? key,
    required this.icone,
    required this.texto,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          child: Row(
            children: [
              icone,
              SizedBox(
                width: 4,
              ),
              Text(
                texto,
                style: TextStyle(
                    color: Colors.grey[700], fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class CabecalhoPostagem extends StatelessWidget {
  final Postagem postagem;
  const CabecalhoPostagem({
    Key? key,
    required this.postagem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImagemPerfil(
          urlImagem: postagem.usuario.urlImagem,
          foiVisualizado: true,
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                postagem.usuario.nome,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Row(
                children: [
                  Text(
                    "${postagem.tempoAtras} - ",
                  ),
                  Icon(
                    Icons.public,
                    size: 12,
                    color: Colors.grey,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
      ],
    );
  }
}
