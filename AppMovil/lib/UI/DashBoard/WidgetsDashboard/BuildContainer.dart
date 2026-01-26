import 'package:flutter/material.dart';

class BuildContainer extends StatelessWidget {
  final IconData icon; // Icono del contenedor
  final Color color;
  final double size; // Icono del contenedor
  final String text; // Texto del contenedor
  final VoidCallback onTap; // Ruta de navegación
  final Color background;

  const BuildContainer({
    super.key,
    required this.icon,
    required this.text,
     required this.size,
    required this.color,
    required this.background,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // Establece el ancho del contenedor
      height: 100, // Establece la altura del contenedor
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: const Color(0xFFE2E2E2),
          borderRadius: BorderRadius.circular(10), // Establece el radio de borde para el InkWell
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon, // Utiliza el icono proporcionado
                size: size,
                color: color, // Cambia el color del icono si es necesario
              ),
              const SizedBox(height: 2), // Espacio más pequeño entre el ícono y el texto
              Flexible(
                child: Text(
                  text, // Utiliza el texto proporcionado
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
