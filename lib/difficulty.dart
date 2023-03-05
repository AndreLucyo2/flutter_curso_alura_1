import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int dificulttyLevel;

  const Difficulty({
    required this.dificulttyLevel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
          //implementado logica para cor da estrela conforme a dificuldde
          color: (dificulttyLevel >= 1) ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (dificulttyLevel >= 2) ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (dificulttyLevel >= 3) ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (dificulttyLevel >= 4) ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (dificulttyLevel >= 5) ? Colors.blue : Colors.blue[100],
        ),
      ],
    );
  }
}
