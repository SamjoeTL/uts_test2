import 'package:flutter/material.dart';
import 'package:uts_test/Homepage.dart';

class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            'https://i.postimg.cc/fyBrN7cH/download-8.jpg',
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('Costume 1'),
                  Text('/3 Days'),
                ],
              ),
              Column(
                children: [
                  Text('Rp.100.000'),
                  Text(''),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.call,
                    size: 24,
                    color: Colors.purple,
                  ),
                  Text('call'),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.send,
                    size: 24,
                    color: Colors.purple,
                  ),
                  Text('send'),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.share,
                    size: 24,
                    color: Colors.purple,
                  ),
                  Text('share'),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus leo dolor, ultrices id sollicitudin at, pellentesque id ante. Proin risus ipsum, ornare fringilla maximus vel, malesuada eget metus. Nunc quam nulla, tincidunt eget suscipit in, porttitor at erat. Nunc a mollis nisl. Suspendisse facilisis varius laoreet. Donec euismod bibendum metus ut luctus. Mauris tempor, enim ac pellentesque tincidunt, magna lectus commodo lacus, at rhoncus magna dolor sed nulla. Aliquam id feugiat ante. Pellentesque ac elit massa. Fusce auctor leo sit amet rutrum efficitur. Praesent non molestie leo. Etiam maximus faucibus orci, ullamcorper tristique mauris sodales ac.',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                    },
                    icon: Icon(
                      Icons.shop_rounded,
                      size: 24,
                    ),
                    label: Text('Order Now'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}