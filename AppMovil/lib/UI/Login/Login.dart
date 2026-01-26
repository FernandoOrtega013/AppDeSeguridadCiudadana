import 'dart:io';
import 'package:flutter/material.dart';
import 'package:untitled2/UI/Login/WidgetsLogin/LoginImage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usuario = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscureText = true; // Controla la visibilidad del texto de la contraseña
  double _scale = 1.0;


  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0F2A44);
    const secondBlue = Color(0xFF111827);

    return WillPopScope(
      child: Scaffold(
        backgroundColor: primaryBlue,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints)
            {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const LoginImage(),
                        const SizedBox(height: 40),
                        const Text(
                          "INICIAR SESIÓN",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            //decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            decorationThickness: 1.5,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "App de seguridad ciudadana",
                          style: TextStyle(
                            color: Color(0xFFBDBDBD),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            //decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            decorationThickness: 1.5,
                          ),
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          height: 50,
                          width: 300,
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              autofocus: true,
                              style: const TextStyle(color: Colors.black),
                              cursorColor: Colors.black,
                              controller: usuario,
                              decoration: InputDecoration(
                                hintText: "Ingresa la cédula",
                                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 300,
                          height: 50,
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              style: const TextStyle(color: Colors.black),
                              cursorColor: Colors.black,
                              controller: password,
                              obscureText: obscureText,
                              decoration: InputDecoration(
                                hintText: "Ingresa la contraseña",
                                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.black),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    obscureText ? Icons.visibility : Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      obscureText = !obscureText;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 70),
                  
                        Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
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
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.popAndPushNamed(context, '/Dashboard');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: secondBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  fixedSize: const Size(300, 60),
                                ),
                                child: const Text(
                                  "Entrar",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              );
            },
                
          ),
        ),
      ),
      onWillPop: () async {
        exit(0);
        // return true;
      },
    );
  }
}
