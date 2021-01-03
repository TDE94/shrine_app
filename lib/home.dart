import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:intl/intl.dart';
import 'package:waterapp/model/product.dart';
import 'package:waterapp/model/products_repository.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.grey,
          title: LocaleText(
            'diamond',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(Icons.menu, semanticLabel: 'menu'),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                semanticLabel: 'search',
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.tune,
                semanticLabel: 'filter',
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                semanticLabel: 'setting',
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
        body: GridView.count(
          padding: EdgeInsets.all(16),
          crossAxisCount: 2,
          childAspectRatio: 8.0 / 9.0,
          children: _buildCards(context),
        ));
  }

  List<Card> _buildCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);
    if (products == null || products.isEmpty) {
      return const <Card>[];
    }
    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((products) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
                aspectRatio: 18.0 / 11.0,
                child: Image.asset(
                  products.assetName,
                  package: products.assetPackage,
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    products.name,
                    style: theme.textTheme.headline6,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    formatter.format(
                      products.price,
                    ),
                    style: theme.textTheme.subtitle2,
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }).toList();
  }
}
