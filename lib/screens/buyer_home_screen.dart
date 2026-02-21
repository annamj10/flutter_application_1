import 'package:flutter/material.dart';
import '../utils/colors.dart';

class BuyerHomeScreen extends StatefulWidget {
  const BuyerHomeScreen({super.key});

  @override
  State<BuyerHomeScreen> createState() => _BuyerHomeScreenState();
}

class _BuyerHomeScreenState extends State<BuyerHomeScreen> {
  int _selectedIndex = 0;
  String _selectedCategory = 'All';

  final List<Map<String, dynamic>> categories = [
    {'name': 'All', 'icon': Icons.apps, 'color': JojoColors.primary},
    {'name': 'Baked Goods', 'icon': Icons.bakery_dining, 'color': JojoColors.pastelPink},
    {'name': 'Pickles', 'icon': Icons.kitchen, 'color': JojoColors.pastelMint},
    {'name': 'Sweets', 'icon': Icons.cake, 'color': JojoColors.pastelYellow},
    {'name': 'Snacks', 'icon': Icons.food_bank, 'color': JojoColors.pastelPeach},
  ];

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Chocolate Cake',
      'seller': 'Maria\'s Bakery',
      'price': 15.99,
      'rating': 4.8,
      'category': 'Baked Goods',
      'image': '🍰',
      'distance': '0.5 km',
    },
    {
      'name': 'Mango Pickle',
      'seller': 'Grandma\'s Recipe',
      'price': 8.99,
      'rating': 4.9,
      'category': 'Pickles',
      'image': '🥭',
      'distance': '1.2 km',
    },
    {
      'name': 'Gulab Jamun',
      'seller': 'Sweet Delights',
      'price': 10.99,
      'rating': 4.7,
      'category': 'Sweets',
      'image': '🍬',
      'distance': '0.8 km',
    },
    {
      'name': 'Cookies',
      'seller': 'Cookie Jar',
      'price': 6.99,
      'rating': 4.8,
      'category': 'Baked Goods',
      'image': '🍪',
      'distance': '0.3 km',
    },
  ];

  List<Map<String, dynamic>> get filteredProducts {
    if (_selectedCategory == 'All') {
      return products;
    }
    return products.where((p) => p['category'] == _selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: JojoColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Discover'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Location Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                const Icon(Icons.location_on, color: JojoColors.primary, size: 20),
                const SizedBox(width: 4),
                const Expanded(
                  child: Text(
                    'Mumbai, Maharashtra',
                    style: TextStyle(
                      color: JojoColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Change',
                    style: TextStyle(color: JojoColors.primary),
                  ),
                ),
              ],
            ),
          ),

          // Categories
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = _selectedCategory == category['name'];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategory = category['name'];
                    });
                  },
                  child: Container(
                    width: 70,
                    margin: const EdgeInsets.only(right: 12),
                    child: Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: isSelected 
                                ? category['color'] 
                                : category['color'].withOpacity(0.3),
                            shape: BoxShape.circle,
                            border: isSelected
                                ? Border.all(color: JojoColors.primary, width: 2)
                                : null,
                          ),
                          child: Icon(
                            category['icon'],
                            color: isSelected ? Colors.white : category['color'],
                            size: 25,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          category['name'],
                          style: TextStyle(
                            fontSize: 11,
                            color: isSelected
                                ? JojoColors.textPrimary
                                : JojoColors.textSecondary,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Products Grid
          Expanded(
            child: filteredProducts.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.inventory_2_outlined,
                          size: 80,
                          color: JojoColors.textSecondary.withOpacity(0.5),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No products found',
                          style: TextStyle(
                            fontSize: 18,
                            color: JojoColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return _buildProductCard(product);
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 3) {
            Navigator.pushNamed(context, '/profile');
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: JojoColors.primary,
        unselectedItemColor: JojoColors.textSecondary,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product-detail');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: JojoColors.pastelLavender.withOpacity(0.3),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        product['image'],
                        style: const TextStyle(fontSize: 40),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.favorite_border,
                          size: 16,
                          color: JojoColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Product Details
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: JojoColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    product['seller'],
                    style: TextStyle(
                      fontSize: 11,
                      color: JojoColors.textSecondary,
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 12,
                        color: JojoColors.pastelYellow,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        product['rating'].toString(),
                        style: TextStyle(
                          fontSize: 10,
                          color: JojoColors.textSecondary,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Icon(
                        Icons.location_on,
                        size: 10,
                        color: JojoColors.textSecondary,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        product['distance'],
                        style: TextStyle(
                          fontSize: 9,
                          color: JojoColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product['price'].toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: JojoColors.primary,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: JojoColors.primary.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add_shopping_cart,
                          size: 14,
                          color: JojoColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}