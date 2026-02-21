import 'package:flutter/material.dart';
import '../utils/colors.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the product data passed from previous screen
    final product = ModalRoute.of(context)?.settings.arguments;
    
    return Scaffold(
      backgroundColor: JojoColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              height: 300,
              width: double.infinity,
              color: JojoColors.pastelLavender.withOpacity(0.3),
              child: const Center(
                child: Text(
                  '🍰',
                  style: TextStyle(fontSize: 100),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name and Seller
                  const Text(
                    'Homemade Chocolate Cake',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: JojoColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text(
                        'by Sarah\'s Kitchen',
                        style: TextStyle(
                          fontSize: 16,
                          color: JojoColors.textSecondary,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: JojoColors.pastelMint,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Baked Goods',
                          style: TextStyle(
                            fontSize: 12,
                            color: JojoColors.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Rating and Distance
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: JojoColors.pastelYellow,
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '4.8',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: JojoColors.textPrimary,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.location_on,
                        color: JojoColors.textSecondary,
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '0.5 km away',
                        style: TextStyle(
                          fontSize: 14,
                          color: JojoColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 18,
                          color: JojoColors.textSecondary,
                        ),
                      ),
                      Text(
                        '\$15.99',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: JojoColors.primary,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Description
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: JojoColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Delicious homemade chocolate cake made with love. Perfect for birthdays, celebrations, or just because! Each cake is baked fresh to order using premium ingredients.',
                    style: TextStyle(
                      fontSize: 14,
                      color: JojoColors.textSecondary,
                      height: 1.5,
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Seller Info
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: JojoColors.pastelLavender.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: JojoColors.pastelPeach,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.person,
                            color: JojoColors.primary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Sarah\'s Kitchen',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: JojoColors.textPrimary,
                                ),
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
                                  const Text(
                                    '4.9',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: JojoColors.textSecondary,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    '128 orders',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: JojoColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'View Store',
                            style: TextStyle(color: JojoColors.primary),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Add to Cart Button
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: JojoColors.primary,
                            side: const BorderSide(color: JojoColors.primary),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Add to Cart',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/cart');
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: const Text(
                            'Buy Now',
                            style: TextStyle(fontSize: 16),
                          ),
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