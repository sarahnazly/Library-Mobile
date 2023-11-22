import 'package:flutter/material.dart';
import 'package:library_mobile/models/product.dart';


class DetailProductPage extends StatelessWidget {
    final Item item;

    const DetailProductPage({Key? key, required this.item}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(item.fields.name),
            ),
            body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        Text(
                            item.fields.name,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                        SizedBox(height: 20),
                        Text('Amount: ${item.fields.amount}'),
                        SizedBox(height: 20),
                        Text('Description: ${item.fields.description}'),
                    ],
                ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                    Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back),
            ),
        );
    }
}
