// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/components/imagem_perfil.dart';
import 'package:facebook_interface/data/dados.dart';
import 'package:facebook_interface/util/paleta_cores.dart';
import 'package:facebook_interface/util/responsivo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:facebook_interface/models/modelos.dart';

class AreaStory extends StatelessWidget {
  final Usuario usuario;
  final List<Story> stories;

  const AreaStory({
    Key? key,
    required this.usuario,
    required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsivo.isDesktop(context);

    return Container(
      height: 200,
      color: isDesktop ? Colors.transparent : Colors.white,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + stories.length,
          itemBuilder: (context, indice) {
            if (indice == 0) {
              Story storyUser = Story(
                  usuario: usuarioAtual, urlImagem: usuarioAtual.urlImagem);

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: CartaoStory(adicionarStory: true, story: storyUser),
              );
            }
            Story story = stories[indice - 1];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: CartaoStory(story: story),
            );
          }),
    );
  }
}

class CartaoStory extends StatelessWidget {
  final Story story;
  final bool adicionarStory;
  const CartaoStory(
      {Key? key, required this.story, this.adicionarStory = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: story.urlImagem,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
              gradient: PaletaCores.degradeStory,
              borderRadius: BorderRadius.circular(12)),
        ),
        Positioned(
            top: 8,
            left: 8,
            child: adicionarStory
                ? Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      iconSize: 30,
                      color: PaletaCores.azulFacebook,
                    ),
                  )
                : ImagemPerfil(
                    urlImagem: story.usuario.urlImagem,
                    foiVisualizado: story.foiVisualizado,
                  )),
        Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Text(
              adicionarStory ? "Criar Story" : story.usuario.nome,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ))
      ],
    );
  }
}
