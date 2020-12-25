import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shrine/model/product.dart';
import 'package:shrine/model/products_repository.dart';

class Homepage extends StatelessWidget {
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products == null || products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 12, 16, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.name,
                    style: theme.textTheme.headline6,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    // '${product.price}',
                    formatter.format(product.price),
                    style: theme.textTheme.subtitle2,
                    // maxLines: 1,
                  )
                ],
              ),
            ))
          ],
        ),
      );
    }).toList();
  }
  // static cards are made one by one
  // List<Card> cards = List.generate(count, (int index) {
  //   return Card(
  //     clipBehavior: Clip.antiAlias,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         AspectRatio(
  //           aspectRatio: 18.0 / 11.0,
  //           child: Image.asset('assets/diamond.png'),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               Text('Title'),
  //               SizedBox(height: 8.0),
  //               Text('Secondary Text'),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // });
  //return cards;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ShRINE"),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                semanticLabel: 'search',
              ),
              onPressed: () {
                print("search button pressed");
              }),
          IconButton(
            icon: Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: () {
              print('Filter button');
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        // TODO: Build a grid of cards (102)
        children: _buildGridCards(context),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
