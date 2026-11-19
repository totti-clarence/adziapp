import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Header (Simulée)
                    Stack(
                      children: [
                        Container(
                          height: 300,
                          width: double.infinity,
                          color: const Color(0xFFF3E9DC), // Couleur beige pour simuler l'image
                          child: const Center(
                            child: Icon(Icons.bakery_dining, size: 150, color: Colors.brown),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 20,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back, color: Colors.black),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          right: 20,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: const Icon(Icons.favorite, color: Colors.orange),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 20,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                            child: const Text('460 kcal', style: TextStyle(fontSize: 12)),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Text('Croissant au chocolat, ', style: TextStyle(fontSize: 28, fontFamily: 'serif', fontWeight: FontWeight.bold)),
                              Text('110g', style: TextStyle(fontSize: 20, color: Colors.grey)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Ingrédients : œufs de poule, farine, lait 3,2 %, beurre, eau, chocolat noir 54-55 %, mélange, sucre blanc, poudre de cacao, sel, vanilline.',
                            style: TextStyle(color: Colors.black54, height: 1.5),
                          ),
                          const SizedBox(height: 30),
                          const Text('Ajouter à la commande', style: TextStyle(fontSize: 22, fontFamily: 'serif', fontWeight: FontWeight.bold)),
                          const SizedBox(height: 15),
                          SizedBox(
                            height: 150,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                _buildDrinkCard('Latte', '2,00 \$', Colors.brown.shade100),
                                const SizedBox(width: 15),
                                _buildDrinkCard('Thé nordique', '1,80 \$', Colors.red.shade100),
                                const SizedBox(width: 15),
                                _buildDrinkCard('Matcha latte', '1,95 \$', Colors.green.shade100),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Bouton Ajouter au panier fixe en bas
            Container(
              padding: const EdgeInsets.all(20),
              color: const Color(0xFFFAF6F0),
              child: ElevatedButton(
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('5,90 \$', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(width: 20),
                    Text('Ajouter au panier', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDrinkCard(String name, String price, Color color) {
    return Container(
      width: 110,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(color: color, borderRadius: const BorderRadius.vertical(top: Radius.circular(16))),
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                Text(price, style: const TextStyle(color: Colors.grey, fontSize: 10)),
              ],
            ),
          )
        ],
      ),
    );
  }
}