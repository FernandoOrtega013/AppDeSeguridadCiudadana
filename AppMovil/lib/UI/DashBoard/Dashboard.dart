import 'package:flutter/material.dart';
import 'package:untitled2/UI/DashBoard/Danger%20SOS/DangerSos.dart';
import 'package:untitled2/UI/DashBoard/Medical%20SOS/MedicalSos.dart';
import 'package:untitled2/UI/DashBoard/WidgetsDashboard/BuildContainer.dart';


class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  double _scale=1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          actions: [
            GestureDetector(
              onTapDown: (details) {
                setState(() {
                  _scale = 0.95; // Tamaño reducido al presionar
                });
              },
              onTapUp: (details) {
                setState(() {
                  _scale = 1.0; // Tamaño normal al soltar
                });
              },
              onTapCancel: () {
                setState(() {
                  _scale = 1.0; // Tamaño normal si se cancela la interacción
                });
              },
              child: AnimatedScale(
                scale: _scale,
                duration: const Duration(milliseconds: 100), // Duración de la animación
                child: const CircleAvatar(
                  radius: 22,
                  backgroundImage:
                  AssetImage('assets/images/nophoto.jpg'),
                ),
              ),
              onTap: () {
                Navigator.popAndPushNamed(context, '/Profile');
              },
            ),
          ],
        ),
        body:   LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child:  Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BuildContainer(
                    icon: Icons.local_hospital_outlined,
                    text: "SOS MÉDICO",
                    size: 45,
                    color: Colors.white,
                    background: const Color(0xFF1976D2),
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) => const MedicalSOSDialog()
                      );
                      },
                  ),
                  BuildContainer(
                    icon: Icons.remove_red_eye_outlined,
                    text: "ALERTA",
                    size: 45,
                    color: Colors.white,
                    background: const Color(0xFFF9A825),
                    onTap: () { Navigator.popAndPushNamed(context, '/Alert'); },
                  ),
                  BuildContainer(
                    icon: Icons.notifications_active_outlined,
                    text: "SOS PELIGRO",
                    size: 45,
                    color: Colors.white,
                    background: const Color(0xFFD32F2F),
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) => const DangerSOSDialog()
                      );
                    },
                  )
                ],


              ),
            ),
          );
        },
        ),

    );
  }





}
