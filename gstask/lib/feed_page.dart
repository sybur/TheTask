import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          var BoxFit;
          return Container(
            margin: EdgeInsets.all(8),
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    'https://picsum.photos/id//400/300',
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 8),
                  Text('Item $index'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
