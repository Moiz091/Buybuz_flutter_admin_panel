import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:web_admin/views/screens/sidebar_screens/category_screen.dart';
import 'package:web_admin/views/screens/sidebar_screens/dashboard_screen.dart';
import 'package:web_admin/views/screens/sidebar_screens/order_screen.dart';
import 'package:web_admin/views/screens/sidebar_screens/product_screen.dart';
import 'package:web_admin/views/screens/sidebar_screens/upload_banner_screen.dart';
import 'package:web_admin/views/screens/sidebar_screens/vendor_screen.dart';
import 'package:web_admin/views/screens/sidebar_screens/buyer_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selectedItem = DashboardScreen();

  screenSelector(item) {
    switch (item.route) {
      case DashboardScreen.routName:
        setState(() {
          _selectedItem = DashboardScreen();
        });
        break;
      case VendorScreen.routName:
        setState(() {
          _selectedItem = VendorScreen();
        });
        break;
      case CategoryScreen.id:
        setState(() {
          _selectedItem = CategoryScreen();
        });
      case OrderScreen.routeName:
        setState(() {
          _selectedItem = OrderScreen();
        });
        break;
      case ProductScreen.routName:
        setState(() {
          _selectedItem = ProductScreen();
        });
        break;
      case UploadBannerScreen.routName:
        setState(() {
          _selectedItem = UploadBannerScreen();
        });
        break;
      case BuyersScreen.routeName:
        setState(() {
          _selectedItem = BuyersScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('BuyBuz Management System'),
      ),
      sideBar: SideBar(
        items: [
          AdminMenuItem(
            title: 'Dashboard',
            route: DashboardScreen.routName,
            icon: Icons.dashboard,
          ),
          AdminMenuItem(
            title: 'Vendors',
            route: VendorScreen.routName,
            icon: Icons.person,
          ),
          AdminMenuItem(
            title: 'Buyers',
            route: BuyersScreen.routeName,
            icon: Icons.money,
          ),
          AdminMenuItem(
            title: 'Orders',
            route: OrderScreen.routeName,
            icon: Icons.shopping_cart,
          ),
          AdminMenuItem(
            title: 'Categories',
            icon: Icons.category_rounded,
            route: CategoryScreen.id,
          ),
          AdminMenuItem(
            title: 'Upload Banner',
            route: UploadBannerScreen.routName,
            icon: Icons.add,
          ),
          AdminMenuItem(
            title: 'Products',
            route: ProductScreen.routName,
            icon: Icons.shopping_basket,
          ),
        ],
        selectedRoute: '',
        onSelected: (item) {
          screenSelector(item);
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'Admin Panel',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              '© 2024 BuyBuz',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: _selectedItem,
    );
  }
}
