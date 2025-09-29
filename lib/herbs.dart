import 'package:flutter/material.dart';

class HerbsPage extends StatelessWidget {
  const HerbsPage({super.key});

  final List<Map<String, String>> herbs = const [
    {'name': 'Ginger', 'image': 'assets/images/ginger.jpg'},
    {'name': 'Haritaki', 'image': 'assets/images/haritaki.jpg'},
    {'name': 'Licorice', 'image': 'assets/images/licorice.jpg'},
    {'name': 'Neem', 'image': 'assets/images/neem.jpg'},
    {'name': 'Punarnava', 'image': 'assets/images/punarnava.jpg'},
    {'name': 'Tamarind', 'image': 'assets/images/tamarind.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final gridCrossAxisCount = 2;
    final childAspectRatio = (media.size.width / gridCrossAxisCount) /
        ((media.size.width / gridCrossAxisCount) * 0.95);

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF2E8B57),
                Color(0xFF1E6B47),
              ],
            ),
          ),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () => Navigator.of(context).pop(),
                            color: Colors.black,
                            tooltip: 'Back',
                          ),
                          const Expanded(
                            child: Text(
                              'Herbs',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 48),
                        ],
                      ),
                    ),
                    const Divider(height: 1, thickness: 1),
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: gridCrossAxisCount,
                      crossAxisSpacing: 28,
                      mainAxisSpacing: 24,
                      childAspectRatio: childAspectRatio,
                    ),
                    itemCount: herbs.length,
                    itemBuilder: (context, index) {
                      final item = herbs[index];
                      return HerbCard(
                        label: item['name']!,
                        imagePath: item['image']!,
                        onTap: () {

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Tapped ${item['name']}')),
                          );
                        },
                      );
                    },
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

class HerbCard extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onTap;

  const HerbCard({
    super.key,
    required this.imagePath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const borderRadius = 18.0;
    const overlayHeight = 36.0;

    return Semantics(
      button: true,
      label: label,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Stack(
              children: [
                // Image
                Positioned.fill(
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey.shade200,
                      child: const Center(
                        child: Icon(Icons.broken_image, size: 48, color: Colors.black26),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 8,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      height: overlayHeight,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade600.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        label,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          shadows: [
                            Shadow(
                              blurRadius: 2,
                              color: Colors.black26,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.02),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
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