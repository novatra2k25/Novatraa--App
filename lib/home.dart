import 'package:flutter/material.dart';
import 'herbs.dart';
import 'dashboard.dart';
import 'reports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final cardWidth = (media.size.width * 0.82).clamp(280.0, 420.0);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      drawer: _AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.black, size: 30),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    tooltip: 'Open menu',
                  ),

                  const Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  PopupMenuButton<int>(
                    tooltip: 'Profile & actions',
                    icon: const Icon(Icons.account_circle, color: Colors.black, size: 32),
                    onSelected: (value){
                      if (value == 0) {

                      } else if (value == 1) {

                      }
                    },
                    itemBuilder: (ctx) => const [
                      PopupMenuItem(value: 0, child: Text('Profile')),
                      PopupMenuItem(value: 1, child: Text('Logout')),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MenuCard(
                      width: cardWidth,
                      imagePath: 'assets/images/herbs.jpg',
                      label: 'Herbs',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HerbsPage()),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    MenuCard(
                      width: cardWidth,
                      imagePath: 'assets/images/dashboard.jpg',
                      label: 'Dashboard',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const DashboardPage()),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    MenuCard(
                      width: cardWidth,
                      imagePath: 'assets/images/reports.jpg',
                      label: 'Reports',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ReportPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final double width;
  final String imagePath;
  final String label;
  final VoidCallback onTap;

  const MenuCard({
    super.key,
    required this.width,
    required this.imagePath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Material(
        color: Colors.transparent,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Colors.black12),
          ),
          elevation: 3,
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: onTap,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey.shade300,
                      child: const Center(
                        child: Icon(Icons.broken_image, size: 48, color: Colors.black26),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.center,
                  child: Semantics(
                    button: true,
                    label: label,
                    child: Text(
                      label,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const DrawerHeader(
              child: Text('Novatra', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}