import 'package:flutter/material.dart';
import '../utils/colors.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: JojoColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Choose Your Role'),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'How would you like to use JoJo\'s today?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: JojoColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            _buildRoleCard(
              title: 'I want to BUY',
              icon: Icons.shopping_bag,
              description: 'Discover homemade goodies and fresh produce from local sellers',
              gradientColors: [JojoColors.pastelMint, JojoColors.pastelBlue],
              onTap: () {
                Navigator.pushNamed(context, '/buyer-home');
              },
            ),
            const SizedBox(height: 20),
            _buildRoleCard(
              title: 'I want to SELL',
              icon: Icons.storefront,
              description: 'Share your homemade creations and earn money',
              gradientColors: [JojoColors.pastelPeach, JojoColors.pastelPink],
              onTap: () {
                Navigator.pushNamed(context, '/seller-home');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleCard({
    required String title,
    required IconData icon,
    required String description,
    required List<Color> gradientColors,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: gradientColors[0].withOpacity(0.3),
              blurRadius: 15,
              spreadRadius: 2,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 50,
                color: gradientColors[1],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: JojoColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: JojoColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
