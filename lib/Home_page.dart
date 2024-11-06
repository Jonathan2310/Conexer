import 'package:flutter/material.dart';
import 'package:flutter_integrador/Nav_drawer.dart';
import 'package:flutter_integrador/Noti_page.dart';
import 'package:flutter_integrador/See_Event_page.dart';
import 'package:flutter_integrador/News_page.dart';
import 'package:flutter_integrador/Report_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD0E7FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Navigation_menu()));
          },
        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/conexer_logo.png', //logotipo
              height: 40,
            ),
            const SizedBox(width: 10),
            const Text(
              '',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.yellow[700]),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsPage()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Bienvenido',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/conexer_logo.png', // Cambia esta ruta a la de tu imagen
              height: 140,
              width: 400,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            _buildActionText(
              '¿Algún problema en tu comunidad, ¿Quieres reportarlo?',
              'Click para reportar',
              () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ReportsPage()));
              },
            ),
            const SizedBox(height: 15),
            _buildActionText(
              '¿Quieres ver los eventos cercanos a ti?',
              'Click para ver eventos',
              () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EventsPage()));
              },
            ),
            const SizedBox(height: 15),
            _buildActionText(
              '¿Quieres ver las noticias de tu comunidad?',
              'Click para ver noticias',
              () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionText(String question, String buttonText, VoidCallback onPressed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          question,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4D6D90),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}


