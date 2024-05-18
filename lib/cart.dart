import 'package:flutter/material.dart';
import 'package:uts_test/Routes/route.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 1; // Set the initial selected index to 1 (Cart)

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView(
        children: [
          _buildCartItem(
            'Costume 5',
            'https://i.postimg.cc/289K9w8y/download-7.jpg',
            'Price: RP.75.000/3 days',
          ),
          _buildCartItem(
            'Costume 8',
            'https://i.postimg.cc/fyBrN7cH/download-8.jpg',
            'Price: RP.70.000/3 days',
          ),
          _buildCartItem(
            'Costume 1',
            'https://i.postimg.cc/kgkhqgSd/download-2.jpg',
            'Price: RP.100.000/3 days',
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(String title, String imageUrl, String description) {
    return Card(
      child: ListTile(
        leading: Image.network(imageUrl),
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }

  Widget _buildButtonItem(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the Home screen
            Navigator.pushNamed(context, AppRoutes.home);
          },
        ),
        title: Text('Cart'),
      ),
      body: Center(
        child: Text('Cart Page'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Event',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
            switch (index) {
              case 0:
                // Navigate to Home screen
                Navigator.pushNamed(context, AppRoutes.home);
                break;
              case 1:
                // Stay on the Cart screen
                break;
              case 2:
                // Navigate to Event screen
                Navigator.pushNamed(context, AppRoutes.event);
                break;
            }
          });
        },
      ),
    );
  }
}