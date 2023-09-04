// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BotaoCirculo extends StatelessWidget {
  final IconData icone;
  final double iconeTamanho;
  final VoidCallback onPressed;
  const BotaoCirculo({
    Key? key,
    required this.icone,
    required this.iconeTamanho,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
      margin: EdgeInsets.all(6),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icone),
        iconSize: iconeTamanho,
        color: Colors.black,
      ),
    );
  }
}