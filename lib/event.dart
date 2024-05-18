import 'package:flutter/material.dart';
import 'package:uts_test/Routes/route.dart';


class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 2; // Set the initial selected index to 2 (Event)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: ListView(
        children: [
          _buildEventItem(
            'Cosplay Convention',
            'https://example.com/convention.png',
            'June 20, 2024',
          ),
          _buildEventItem(
            'Anime Expo',
            'https://example.com/anime_expo.png',
            'July 15, 2024',
          ),
          _buildEventItem(
            'Gaming Festival',
            'https://example.com/gaming_festival.png',
            'August 10, 2024',
          ),
        ],
      ),
    );
  }

  Widget _buildEventItem(String title, String imageUrl, String date) {
    return Card(
      child: ListTile(
        leading: Image.network(imageUrl),
        title: Text(title),
        subtitle: Text(date),
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
        title: Text('Event'),
      ),
      body: Center(
        child: Text('Event Page'),
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
                // Navigate to Cart screen
                Navigator.pushNamed(context, AppRoutes.Cart);
                break;
              case 2:
                // Stay on the Event screen
                break;
            }
          });
        },
      ),
    );
  }
}