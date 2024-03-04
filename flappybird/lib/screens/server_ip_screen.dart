import 'dart:convert';

import 'package:flappy_bird_game/game/ft_game.dart';
import 'package:flappy_bird_game/game/utils_websockets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ServerIPScreen extends StatefulWidget {
  @override
  _ServerIPScreenState createState() => _ServerIPScreenState();
}

class _ServerIPScreenState extends State<ServerIPScreen> {
  TextEditingController _controllerServerIP = TextEditingController();
  TextEditingController _controllerPlayerName = TextEditingController();
  FtGame servidor = FtGame();
  static late WebSocketsHandler websocket;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/background.png"), // Reemplaza con tu propia imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: Image.asset(
                  "assets/images/titulo.png", // Reemplaza con la ruta de tu propia imagen de título
                  height: 100, // Ajusta la altura según tus necesidades
                ),
              ),
              Text(
                'Ingrese la dirección del servidor:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _controllerServerIP,
                decoration: InputDecoration(
                  hintText: 'Dirección IP',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _controllerPlayerName,
                decoration: InputDecoration(
                  hintText: 'Nombre del jugador',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String serverIP = _controllerServerIP.text;
                  String playerName = _controllerPlayerName.text;
                  mostrarMensaje(context, serverIP, playerName);
                  servidor.initializeWebSocket(playerName);
                },
                child: Text('Conectar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void mostrarMensaje(
      BuildContext context, String serverIP, String playerName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Conexión a servidor'),
          content: Text(
              'Conectado al servidor con la dirección: $serverIP. Jugador: $playerName'),
          actions: [
            TextButton(
              onPressed: () {
                //initializeWebSocket();
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, 'mainMenu');
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
