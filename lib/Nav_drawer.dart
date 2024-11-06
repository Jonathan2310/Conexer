import 'package:flutter/material.dart';
import 'package:flutter_integrador/News_page.dart';
import 'package:flutter_integrador/Report_page.dart';
import 'package:flutter_integrador/See_Event_page.dart';

class Navigation_menu extends StatelessWidget {
  const Navigation_menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF2C4356),
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFFD0E7FA),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/conexer_logo.png',
                      height: 40,
                      width: 200,
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
              ),
            ),
            _buildDrawerItem(
              icon: Icons.home,
              title: 'Home',
              onTap: () => _navigateTo(context, '/home'),
            ),
            _buildDrawerItem(
              icon: Icons.report,
              title: 'Reportes',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ReportsPage()));
               },
            ),
            _buildDrawerItem(
              icon: Icons.newspaper,
              title: 'Noticias',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage()));
              }
            ),
            _buildDrawerItem(
              icon: Icons.event,
              title: 'Eventos',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EventsPage()));
              }
            ),
            _buildDrawerItem(
              icon: Icons.person,
              title: 'Perfil',
              onTap: () => _navigateTo(context, '/perfil'),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Lógica para cerrar sesión
                  _cerrarSesion(context);
                },
                child: const Text(
                  'Cerrar Sesión',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      onTap: onTap,
    );
  }

  void _navigateTo(BuildContext context, String routeName) {
    Navigator.of(context).pop(); // Cierra el drawer
    Navigator.of(context).pushReplacementNamed(routeName);
  }

  void _cerrarSesion(BuildContext context) {
    // Aquí iría la lógica para cerrar la sesión
    // Por ejemplo, limpiar las credenciales almacenadas
    // Luego, navegar a la página de inicio de sesión
    Navigator.of(context).pushReplacementNamed('/login');
  }
}