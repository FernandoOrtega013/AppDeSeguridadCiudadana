import 'package:flutter/material.dart';
import 'package:untitled2/UI/DashBoard/Profile/WidgetsProfile/CurvedHeaderClipper.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  double _scale = 1.0;
  bool _isActionInProgress = false;

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0F2A44);
    const secondBlue = Color(0xFF111827);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Stack(
                children: [
            
                  ClipPath(
                    clipper: CurvedHeaderClipper(),
                    child: Container(
                      height: 260,
                      color: primaryBlue,
                      padding: const EdgeInsets.all(16),
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.popAndPushNamed(context, '/Dashboard'),
                      ),
                    ),
                  ),
            
                  Column(
                    children: [
                      const SizedBox(height: 160),
            
                      // AVATAR
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/nophoto.jpg'),
                      ),
            
                      const SizedBox(height: 12),
            
                      // NOMBRE
                      const Text(
                        "Doña Melba",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
            
                      const SizedBox(height: 6),
            
                      // EMAIL + TEL
                      const Text(
                        "doñamelba@lacansona.com | +57 310 333 6699",
                        style: TextStyle(color: Colors.grey),
                      ),
            
                      const SizedBox(height: 24),

                      /// CARD OPCIONES
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Card(
                          elevation: 3,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.support_agent),
                                title: Text("Ayuda y soporte"),

                              ),

                              ListTile(
                                leading:
                                Icon(Icons.chat_bubble_outline),
                                title: Text("Contáctanos"),

                              ),
                              ListTile(
                                leading: Icon(Icons.lock_outline),
                                title:
                                Text("Política de privacidad"),

                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),
            
            
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
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              if (_isActionInProgress) return; // Bloquear si ya está en progreso
            
                              setState(() {
                                _isActionInProgress = true; // Bloquear nuevas ejecuciones
                              });
            
                              // Llama al método logout del controlador de autenticación
                              //await _authController.logout();
            
                              // Detiene el servicio en segundo plano
                              //ForegroundService().stop();
            
                              // Navega de regreso a la pantalla de inicio
                              Navigator.pushNamed(context, '/Login');
                            },
                            label: const Text(
                              'SALIR',
                              style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: secondBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              fixedSize: const Size(300, 60),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
          
        },
          
        ),
      ),
    );
  }
}
