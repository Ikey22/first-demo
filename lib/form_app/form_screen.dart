import 'package:first_demo/form_app/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 8.0),
        children: [
          GestureDetector(
            onTap: () => _showDailog(context),
            child: const Product(
              image: 'assets/lion.jpg',
              text1: 'HP Laptop',
              text2: '130k',
            ),
          ),
          Product(
            image: 'assets/lion.jpg',
            text1: 'Acer Laptop',
            text2: '200k',
          ),
          Product(
            image: 'assets/lion.jpg',
            text1: 'Lenovo Laptop',
            text2: '30k',
          ),
          Product(
            image: 'assets/lion.jpg',
            text1: 'Toshiba Laptop',
            text2: '45k',
          ),
          Product(
            image: 'assets/lion.jpg',
            text1: 'Dell Laptop',
            text2: '5k',
          ),
        ],
      ),
    );
  }

  void _showDailog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('HP Laptop'),
          content: Text('This is the newest laptop in town'),
          actions: <Widget>[
            TextButton(
              onPressed: () {},
              child: Text('Okay'),
            ),
          ],
        );
      },
    );
  }
}
