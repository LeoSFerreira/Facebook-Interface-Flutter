// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:facebook_interface/models/modelos.dart';

class Story {
  Usuario usuario;
  String urlImagem;
  bool foiVisualizado;
  Story({
    required this.usuario,
    required this.urlImagem,
    this.foiVisualizado = false,
  });
}
