import 'package:flutter/material.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 130,
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(40)),

      child: const Center(
        child: Text(
          '\u{1F44B}',
          style: TextStyle(fontSize: 60), // Ajusta el tamaño aquí
        ),
      ),
    );
  }
}