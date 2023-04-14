import 'package:flutter/material.dart';

class CardComBackground extends StatelessWidget {
  const CardComBackground({super.key, required this.imageAsset});

  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
            minHeight: 100,
            maxHeight: 450,
            minWidth: 100,
            maxWidth: double.infinity),
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              Image.asset(
                imageAsset,
                fit: BoxFit.fitHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key, required this.tipoCard});

  final TipoCard tipoCard;

  @override
  Widget build(BuildContext context) {
    switch (tipoCard) {
      case TipoCard.aluno:
        return CardComBackground(imageAsset: TipoCard.getTipo(tipoCard.id));
      case TipoCard.curso:
        return CardComBackground(imageAsset: TipoCard.getTipo(tipoCard.id));
    }
  }
}

enum TipoCard {
  aluno(1, 'assets/images/aluno.jpg'),
  curso(2, 'assets/images/curso.jpg');

  final int id;
  final String asset;

  const TipoCard(this.id, this.asset);

  static getTipo(int v) {
    return values.where((i) => i.id == v).toList().first.asset;
  }
}
