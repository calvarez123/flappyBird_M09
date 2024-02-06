import 'dart:convert';

import 'package:flame/game.dart';
import 'package:flappy_bird_game/game/assets.dart';
import 'package:flappy_bird_game/game/flappy_bird_game.dart';
import 'package:flappy_bird_game/game/ft_game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatefulWidget {
  final FlappyBirdGame game;
  static const String id = 'mainMenu';
  final String amarillo = "assets/images/bird_midflap.png";
  final String rojo = "assets/images/bird_midflap.png";
  final String azul = "assets/images/bird_midflap.png";
  final String negro = "assets/images/bird_midflap.png";

  const MainMenuScreen({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  FtGame servidor = FtGame();
  int jugadoresConectados = 1;

  bool isVisible1 =
      false; // Variable para controlar la visibilidad del jugador 1
  bool isVisible2 =
      false; // Variable para controlar la visibilidad del jugador 2
  bool isVisible3 =
      false; // Variable para controlar la visibilidad del jugador 3
  bool isVisible4 =
      false; // Variable para controlar la visibilidad del jugador 4

  @override
  Widget build(BuildContext context) {
    widget.game.pauseEngine();

    // Simulamos el número de jugadores conectados (puedes obtener esto de tu lógica de juego)

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Aquí puedes controlar el cambio de visibilidad de cada jugador según tu lógica de juego
          toggleVisibility(3); // Cambia la visibilidad del jugador 4
          //
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.menu),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Mensaje "ESPERANDO JUGADORES..."
              Text(
                'ESPERANDO JUGADORES...',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Número de jugadores conectados
              Text(
                'Jugadores conectados: $jugadoresConectados',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              // Indicador de carga (loading)
              CircularProgressIndicator(
                color: Colors.white,
              ),
              // Espacio
              SizedBox(height: 20),
              // Imágenes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Visibility(
                        visible:
                            isVisible1, // Control de visibilidad del jugador 1
                        child: Image.asset(widget.amarillo),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Visibility(
                        visible:
                            isVisible2, // Control de visibilidad del jugador 2
                        child: Image.asset(widget.amarillo),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Visibility(
                        visible:
                            isVisible3, // Control de visibilidad del jugador 3
                        child: Image.asset(widget.amarillo),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Visibility(
                        visible:
                            isVisible4, // Control de visibilidad del jugador 4
                        child: Image.asset(widget.amarillo),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Botón para jugar (activado cuando hay al menos dos jugadores)
              ElevatedButton(
                onPressed: jugadoresConectados > 1
                    ? () {
                        widget.game.overlays.remove('mainMenu');
                        widget.game.resumeEngine();
                      }
                    : null,
                child: Text('Jugar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void toggleVisibility(int jugador) {
    setState(() {
      // Cambia la visibilidad según el jugador seleccionado
      if (jugador >= 1) isVisible1 = true;
      if (jugador >= 2) isVisible2 = true;
      if (jugador >= 3) isVisible3 = true;
      if (jugador >= 4) isVisible4 = true;
    });
  }
}
