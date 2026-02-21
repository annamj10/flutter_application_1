import 'package:flutter/material.dart';
import '../utils/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: JojoColors.backgroundLight,
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: JojoColors.pastelLavender.withOpacity(0.3),
              ),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [JojoColors.pastelPink, JojoColors.pastelPeach],
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: JojoColors.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Sarah Johnson',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: JojoColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'sarah.j@email.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: JojoColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: JojoColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Buyer & Seller',
                      style: TextStyle(
                        color: JojoColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Stats
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatCard('24', 'Orders'),
                  _buildStatCard('12', 'Products'),
                  _buildStatCard('4.8', 'Rating'),
                ],
              ),
            ),

            // Menu Items
            _buildMenuItem(
              icon: Icons.person_outline,
              title: 'Edit Profile',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.location_on_outlined,
              title: 'My Address',
              subtitle: 'Andheri East, Mumbai',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.payment_outlined,
              title: 'Payment Methods',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.favorite_outline,
              title: 'Favorites',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.history,
              title: 'Order History',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.settings_outlined,
              title: 'Settings',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.help_outline,
              title: 'Help & Support',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.logout,
              title: 'Logout',
              color: Colors.red,
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context, 
                  '/auth', 
                  (route) => false
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: JojoColors.primary,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: JojoColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    String? subtitle,
    Color color = JojoColors.textPrimary,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: JojoColors.textPrimary,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: TextStyle(
                fontSize: 14,
                color: JojoColors.textSecondary,
              ),
            )
          : null,
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: JojoColors.textSecondary,
      ),
      onTap: onTap,
    );
  }
}
