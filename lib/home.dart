import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  // Placeholder screens for each tab
  final List<Widget> _screens = [
    const _HomeScreen(),
    const _ShopScreen(),
    const _DoctorScreen(),
    const _CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kure"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Doctor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}

// ======= PLACEHOLDER SCREENS ========
class _HomeScreen extends StatelessWidget {
  const _HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSection("PRESCRIPTIONS"),
          _buildSection("AUTOMATED REFILL"),
          _buildSection("TRANSFER RX"),
          _buildSection("VACCINES"),
        ],
      ),
    );
  }

  Widget _buildSection(String title) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffffffff)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}

class _ShopScreen extends StatelessWidget {
  const _ShopScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> _products = const [
    {'name': 'Panadol', 'price': '50', 'unit': 'Tablet, 500mg'},
    {'name': 'Brufen', 'price': '80', 'unit': 'Tablet, 400mg'},
    {'name': 'Augmentin', 'price': '350', 'unit': 'Tablet, 625mg'},
    {'name': 'Calpol', 'price': '120', 'unit': 'Syrup, 120ml'},
    {'name': 'Flagyl', 'price': '90', 'unit': 'Tablet, 400mg'},
    {'name': 'Disprin', 'price': '30', 'unit': 'Tablet, 300mg'},
    {'name': 'Ciprofloxacin', 'price': '200', 'unit': 'Tablet, 500mg'},
    {'name': 'Zentel', 'price': '70', 'unit': 'Tablet, 400mg'},
    {'name': 'Ponstan', 'price': '60', 'unit': 'Tablet, 250mg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Bar
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
        ),

        // Product List (9 items)
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _products.length,
            itemBuilder: (context, index) {
              final product = _products[index];
              return _buildProductItem(
                name: product['name']!,
                price: product['price']!,
                unit: product['unit']!,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductItem({
    required String name,
    required String price,
    required String unit,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Empty image placeholder (grey box)
            Container(
              width: 80,
              height: 80,
              color: Colors.grey[200],
              margin: const EdgeInsets.only(right: 16),
            ),

            // Product details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    unit,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            // Price and add button
            Column(
              children: [
                Text(
                  '₨$price',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF0593119),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle),
                  color: const Color(0xFF0593119),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DoctorScreen extends StatelessWidget {
  const _DoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Book a Doctor"));
  }
}

class _CartScreen extends StatelessWidget {
  const _CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Your Cart"));
  }
}
