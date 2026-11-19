import 'package:flutter/material.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Localisation
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Regent Street, 16',
                        style: TextStyle(fontSize: 22, fontFamily: 'serif', fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.tune)),
                ],
              ),
              const SizedBox(height: 20),

              // Grille des catégories
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.1,
                children: [
                  _buildCategoryCard('Offres de la\nsemaine', const Color(0xFFF2994A), isSpecial: true),
                  _buildCategoryCard('Biscuits', const Color(0xFFE8DCCB)),
                  _buildCategoryCard('Boissons', const Color(0xFFE8DCCB)),
                  _buildCategoryCard('Desserts', const Color(0xFFE8DCCB)),
                  _buildCategoryCard('Pizzas', const Color(0xFFE8DCCB)),
                  _buildCategoryCard('Salades', const Color(0xFFE8DCCB)),
                ],
              ),
              const SizedBox(height: 30),

              // Section Places
              const Text('Établissements', style: TextStyle(fontSize: 22, fontFamily: 'serif', fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              SizedBox(
                height: 160,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    // ⚠️ ICI : On ajoute 'context' en premier paramètre
                    _buildPlaceCard(context, 'Sundown café', 'Cuisine italienne • 60 min', '4.9', Colors.blueGrey),
                    const SizedBox(width: 15),
                    // ⚠️ ICI : On ajoute 'context' en premier paramètre
                    _buildPlaceCard(context, 'The cozy cup', 'Petit-déjeuner, café • 35 min', '4.8', Colors.brown),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Section Best prices
              Row(
                children: [
                  const Text('Meilleurs prix', style: TextStyle(fontSize: 22, fontFamily: 'serif', fontWeight: FontWeight.bold)),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: Colors.green.shade100, borderRadius: BorderRadius.circular(10)),
                    child: const Text('%', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildBestPriceCard('Framboise', Colors.pink.shade100),
                    const SizedBox(width: 15),
                    _buildBestPriceCard('Latte', Colors.brown.shade100),
                    const SizedBox(width: 15),
                    _buildBestPriceCard('Burrito', Colors.orange.shade100),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, Color color, {bool isSpecial = false}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSpecial ? color : Colors.transparent,
        border: isSpecial ? null : Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: isSpecial ? Colors.white : Colors.black87)),
          if (isSpecial)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: Colors.orange.shade200, borderRadius: BorderRadius.circular(8)),
              child: const Text('-75%', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            )
          else
            const Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.image, color: Colors.black26),
            )
        ],
      ),
    );
  }

  // ⚠️ ICI : Ajout de 'BuildContext context' dans les paramètres
  Widget _buildPlaceCard(BuildContext context, String name, String subtitle, String rating, Color color) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductDetailScreen())),
      child: Container(
        width: 200,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 10)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBestPriceCard(String name, Color color) {
    return Stack(
      children: [
        Container(
          width: 100,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(color: Color(0xFFF2994A), shape: BoxShape.circle),
            child: const Icon(Icons.add, size: 16, color: Colors.white),
          ),
        )
      ],
    );
  }
}