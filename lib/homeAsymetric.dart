import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:waterapp/model/product.dart';
import 'package:waterapp/model/products_repository.dart';
import 'package:waterapp/supplemental/asymmetric_view.dart';

class HomeAsymetric extends StatefulWidget {
  @override
  _HomeAsymetricState createState() => _HomeAsymetricState();
}

class _HomeAsymetricState extends State<HomeAsymetric> {
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
      body: AsymmetricView(
        products: ProductsRepository.loadProducts(Category.all),
      ),
    );
  }
}
