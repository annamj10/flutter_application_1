import 'package:flutter/material.dart';
import '../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  final String role;

  const HomeScreen({super.key, required this.role});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> categories = [
    'All',
    'Baked Goods',
    'Meals',
    'Fruits',
    'Vegetables',
    'Snacks',
  ];

  final List<Map<String, String>> featuredItems = [
    {
      'title': 'Fresh Baked Bread',
      'image': '🍞',
      'seller': 'Maria\'s Bakery'
    },
    {
      'title': 'Organic Vegetables',
      'image': '🥕',
      'seller': 'Green Farm'
    },
    {
      'title': 'Homemade Cookies',
      'image': '🍪',
      'seller': 'Sweet Treats'
    },
    {
      'title': 'Fresh Fruits',
      'image': '🍎',
      'seller': 'Sunrise Orchard'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.role == 'buyer' ? 'Discover' : 'My Store'),
        backgroundColor: JojoColors.white,
        elevation: 0,
        actions: [
          if (widget.role == 'buyer') ...[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined),
              onPressed: () {},
            ),
          ] else ...[
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () {},
            ),
          ],
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Banner
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    JojoColors.pastelPeach,
                    JojoColors.pastelPink,
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, Food Lover! 👋',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: JojoColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.role == 'buyer'
                              ? 'Discover homemade goodness near you'
                              : 'Ready to share your creations?',
                          style: const TextStyle(
                            color: JojoColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      widget.role == 'buyer' ? Icons.shopping_bag : Icons.store,
                      color: JojoColors.primary,
                    ),
                  ),
                ],
              ),
            ),

            // Categories
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: JojoColors.textPrimary,
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(categories[index]),
                      selected: index == 0,
                      onSelected: (value) {},
                      backgroundColor: JojoColors.pastelLavender.withOpacity(0.3),
                      selectedColor: JojoColors.primary,
                      checkmarkColor: Colors.white,
                      labelStyle: TextStyle(
                        color: index == 0 ? Colors.white : JojoColors.textSecondary,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Featured Items Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Featured Items',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: JojoColors.textPrimary,
                ),
              ),
            ),

            // Manual Carousel Alternative
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: featuredItems.length,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              JojoColors.pastelMint,
                              JojoColors.pastelBlue,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: Text(
                                  featuredItems[index]['image'] ?? '🍽️',
                                  style: const TextStyle(fontSize: 60),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      featuredItems[index]['title'] ?? '',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: JojoColors.textPrimary,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'by ${featuredItems[index]['seller']}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: JojoColors.textSecondary,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: JojoColors.primary,
                                        foregroundColor: Colors.white,
                                        minimumSize: const Size(100, 35),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                      child: const Text('View'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        featuredItems.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? JojoColors.primary
                                : JojoColors.primary.withOpacity(0.3),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Near You Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Near You',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: JojoColors.textPrimary,
                ),
              ),
            ),

            // Product Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return _buildProductCard(index);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: JojoColors.primary,
        unselectedItemColor: JojoColors.textSecondary,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          if (widget.role == 'buyer') ...[
            const BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              activeIcon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined),
              activeIcon: Icon(Icons.notifications),
              label: 'Orders',
            ),
          ] else ...[
            const BottomNavigationBarItem(
              icon: Icon(Icons.inventory_outlined),
              activeIcon: Icon(Icons.inventory),
              label: 'Products',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.receipt_outlined),
              activeIcon: Icon(Icons.receipt),
              label: 'Orders',
            ),
          ],
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: [
                  JojoColors.pastelPeach,
                  JojoColors.pastelMint,
                  JojoColors.pastelLavender,
                  JojoColors.pastelPink,
                ][index % 4],
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  ['🍰', '🥗', '🍎', '🥕'][index % 4],
                  style: const TextStyle(fontSize: 40),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ['Chocolate Cake', 'Fresh Salad', 'Organic Apples', 'Farm Carrots'][index % 4],
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
                  ['by Sweet Treats', 'by Green Bowl', 'by Nature\'s Best', 'by Local Farm'][index % 4],
                  style: TextStyle(
                    fontSize: 12,
                    color: JojoColors.textSecondary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 14,
                      color: JojoColors.pastelYellow,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      '4.8',
                      style: TextStyle(
                        fontSize: 12,
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
                      '\$${[12, 8, 6, 5][index % 4]}.99',
                      style: const TextStyle(
                        fontSize: 16,
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
                        size: 16,
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
    );
  }
}
