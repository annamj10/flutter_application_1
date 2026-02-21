import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/role_selection_screen.dart';
import 'screens/buyer_home_screen.dart';
import 'screens/seller_home_screen.dart';
import 'screens/add_product_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/profile_screen.dart';
import 'utils/colors.dart';

void main() {
  runApp(const JoJosApp());
}

class JoJosApp extends StatelessWidget {
  const JoJosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JoJo\'s - Homemade Goodness',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: JojoColors.primary,
        scaffoldBackgroundColor: JojoColors.backgroundLight,
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          backgroundColor: JojoColors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: JojoColors.textPrimary),
          titleTextStyle: TextStyle(
            color: JojoColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: JojoColors.primary,
            foregroundColor: JojoColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        // Splash screen - can be const
        '/': (context) => const SplashScreen(),
        
        // Auth screen - can be const
        '/auth': (context) => const AuthScreen(),
        
        // Role selection - can be const
        '/role-selection': (context) => const RoleSelectionScreen(),
        
        // Buyer home - REMOVED const
        '/buyer-home': (context) => BuyerHomeScreen(),
        
        // Seller home - REMOVED const
        '/seller-home': (context) => SellerHomeScreen(),
        
        // Add product - can be const
        '/add-product': (context) => const AddProductScreen(),
        
        // Product detail - REMOVED const
        '/product-detail': (context) => ProductDetailScreen(),
        
        // Cart - REMOVED const
        '/cart': (context) => CartScreen(),
        
        // Profile - can be const
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}