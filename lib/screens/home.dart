// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'package:facebook_interface/components/area_criar_postagem.dart';
import 'package:facebook_interface/components/area_story.dart';
import 'package:facebook_interface/components/botao_circulo.dart';
import 'package:facebook_interface/components/cartao_postagem.dart';
import 'package:facebook_interface/components/lista_contatos.dart';
import 'package:facebook_interface/components/lista_opcoes.dart';
import 'package:facebook_interface/data/dados.dart';
import 'package:facebook_interface/models/modelos.dart';
import 'package:facebook_interface/util/paleta_cores.dart';
import 'package:facebook_interface/util/responsivo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TrackingScrollController _scrollController = TrackingScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsivo(
            mobile: HomeMobile(
              scrollController: _scrollController,
            ),
            desktop: HomeDesktop(
              scrollController: _scrollController,
            )),
      ),
    );
  }
}

class HomeMobile extends StatelessWidget {
  final TrackingScrollController scrollController;
  const HomeMobile({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          floating: true,
          centerTitle: false,
          title: Text(
            "Facebook",
            style: TextStyle(
                color: PaletaCores.azulFacebook,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                letterSpacing: -1.2),
          ),
          actions: [
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
        ),
        SliverToBoxAdapter(
          child: AreaCriarPostagem(usuario: usuarioAtual),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: AreaStory(usuario: usuarioAtual, stories: stories),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          Postagem postagem = postagens[index];
          return CartaoPostagem(postagem: postagem);
        }, childCount: postagens.length))
      ],
    );
  }
}

class HomeDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;
  const HomeDesktop({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: ListaOpcoes(
                usuario: usuarioAtual,
              ),
            )),
        Spacer(),
        Flexible(
            flex: 5,
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                  sliver: SliverToBoxAdapter(
                    child: AreaStory(usuario: usuarioAtual, stories: stories),
                  ),
                ),
                SliverToBoxAdapter(
                  child: AreaCriarPostagem(usuario: usuarioAtual),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  Postagem postagem = postagens[index];
                  return CartaoPostagem(postagem: postagem);
                }, childCount: postagens.length))
              ],
            )),
        Spacer(),
        Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: ListaContatos(usuarios: usuariosOnline),
            )),
      ],
    );
  }
}
