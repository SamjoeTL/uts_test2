import 'package:flutter/material.dart';
import 'package:uts_test/cart.dart';
import 'package:uts_test/datas_screen.dart';
import 'package:uts_test/event.dart';
import 'package:uts_test/product.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width > 800;

    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 0,
          leading: isLargeScreen
              ? null
              : IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Winter.Cosrentt",
                  style: TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.bold),
                ),
                if (isLargeScreen) Expanded(child: _navBarItems(context))
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: _ProfileIcon(context: context),
            )
          ],
        ),
        drawer: isLargeScreen ? null : _drawer(context),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemCount: costumes.length,
          itemBuilder: (context, index) {
            final costume = costumes[index];
            return Product(
  imageUrl: costume['imageUrl']!,
  title: costume['title']!,
  rentalPrice: double.parse(costume['Rental Price']!.replaceAll('Rp.', '')), onTap: () {  },
);
          },
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
             Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
            break;
          case 1:
            // Navigate to Cart screen
             Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CartPage()),
                        );
            break;
          case 2:
            // Navigate to Event screen
            Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EventPage()),
                        );
            break;
        }
      });
    },  
    ),
      ),
    );
  }
  

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        // Navigate to Cart screen
      } else if (index == 2) {
        // Navigate to Event screen
      }
    });
  }

  Widget _drawer(BuildContext context) => Drawer(
        child: ListView(
          children: _menuItems
              .map((item) => ListTile(
                    onTap: () {
                      if (item == 'API') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const DatasScreen()),
                        );
                      }  else {
                        _scaffoldKey.currentState?.openEndDrawer();
                      }
                    },
                    title: Text(item),
                  ))
              .toList(),
        ),
      );

  Widget _navBarItems(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _menuItems
            .map(
              (item) => InkWell(
                onTap: () {
                  if (item == 'API') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DatasScreen()),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 16),
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )
            .toList(),
      );
}

final List<String> _menuItems = <String>[
  'About',
  'Accounts',
  'Settings',
  'API',
  'Sign Out',
];

enum Menu { itemOne, itemTwo, itemThree }

class _ProfileIcon extends StatelessWidget {
  final BuildContext context;

  const _ProfileIcon({Key? key, required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Menu>(
        icon: const Icon(Icons.person),
        offset: const Offset(0, 40),
        onSelected: (Menu item) {
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              const PopupMenuItem<Menu>(
                value: Menu.itemOne,
                child: Text('Accounts'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.itemTwo,
                child: Text('Settings'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.itemThree,
                child: Text('Sign Out'),
              ),
            ]);
  }
}

class Product extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double rentalPrice;
  final VoidCallback onTap;

  const Product({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.rentalPrice,
    required this.onTap,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SamplePage(
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9, // Rasio aspek 16:9
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),  
                SizedBox(height: 4),
                Text(
                  'Rp. ${rentalPrice}/3 day',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.purple,
                  ), 
                  textAlign: TextAlign.center,
                ), 
              ],
            ),
          ),
        ],
      ),
    )
    );
  }
}// Your existing container code

      

final List<Map<String, String>> costumes = [
  {
    'imageUrl': 'https://i.postimg.cc/kgkhqgSd/download-2.jpg',
    'title': 'Costume 1',
    'Rental Price': 'Rp.100000',
  },
  {
    'imageUrl': 'https://i.postimg.cc/kgVh0bBc/download-3.jpg',
    'title': 'Costume 2',
    'Rental Price': 'Rp.80000',
  },
  {
    'imageUrl': 'https://i.postimg.cc/43V2dRvH/download-5.jpg',
    'title': 'Costume 3',
    'Rental Price': 'Rp.130000',
  },
  {
    'imageUrl': 'https://i.postimg.cc/L68WV7SG/download-6.jpg',
    'title': 'Costume 4',
    'Rental Price': 'Rp.55000',
  },
  {
    'imageUrl': 'https://i.postimg.cc/289K9w8y/download-7.jpg',
    'title': 'Costume 5',
    'Rental Price': 'Rp.75000',
  },
  {
    'imageUrl': 'https://i.postimg.cc/W379GmH2/download-1.jpg',
    'title': 'Costume 6',
    'Rental Price': 'Rp.65000',
  },
  {
    'imageUrl': 'https://i.postimg.cc/k4C1RYw1/download-4.jpg',
    'title': 'Costume 7',
    'Rental Price': 'Rp.60000',
  },
  {
    'imageUrl': 'https://i.postimg.cc/fyBrN7cH/download-8.jpg',
    'title': 'Costume 8',
    'Rental Price': 'Rp.70000',
  },
];

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
      ), 
      itemCount: costumes.length,
      itemBuilder: (context, index) {
        final costume = costumes[index];
        return Product(
          imageUrl: costume['imageUrl']!,
          title: costume['title']!,
          rentalPrice: double.parse(costume['Rental Price']!.replaceAll('Rp.', '')), onTap: () {  },
        );
      },
    );
  }
}