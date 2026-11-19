import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int deliveryType = 0; // 0 pour Standard, 1 pour Express

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panier, 3 articles', style: TextStyle(fontFamily: 'serif', fontSize: 24, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.close), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // Options de livraison
                    _buildDeliveryOption('Livraison standard, 40–60 minutes', 'Gratuit', 0),
                    const Divider(height: 30),
                    _buildDeliveryOption('Express, 15–25 minutes', '2,00 \$', 1),
                    const SizedBox(height: 20),

                    // Liste des articles
                    _buildCartItem('Gnocchis sauce champignons, 230g', '5,60 \$', Colors.green.shade100),
                    _buildCartItem('Wenzel aux framboises et groseilles, 170g', '3,80 \$', Colors.red.shade100),
                    _buildCartItem('Jus d\'orange fraîchement pressé, 350ml', '2,30 \$', Colors.orange.shade100),

                    const SizedBox(height: 20),
                    // Promocode
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Code promo', style: TextStyle(color: Colors.grey)),
                          Row(
                            children: [
                              Text('TASTE2025', style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(width: 8),
                              Icon(Icons.check, color: Colors.orange, size: 18),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bouton de commande
            Container(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('11,70 \$', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Confirmer la commande', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryOption(String title, String price, int value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Text(title, style: const TextStyle(fontSize: 14)),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(4)),
                child: Text(price, style: const TextStyle(color: Colors.orange, fontSize: 12)),
              )
            ],
          ),
        ),
        Radio(
          value: value,
          groupValue: deliveryType,
          activeColor: const Color(0xFFF2994A),
          onChanged: (val) => setState(() => deliveryType = val!),
        ),
      ],
    );
  }

  Widget _buildCartItem(String title, String price, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.fastfood, color: Colors.white), // Placeholder
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                Text(price, style: const TextStyle(color: Color(0xFFF2994A), fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          // Contrôle de quantité
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(8)),
            child: const Row(
              children: [
                Icon(Icons.remove, size: 16, color: Colors.grey),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text('1', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Icon(Icons.add, size: 16, color: Colors.grey),
              ],
            ),
          )
        ],
      ),
    );
  }
}