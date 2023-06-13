import 'package:flutter/material.dart';
import 'package:shop_ecommerce/features/search/search_screen.dart';

import '../../shared/components/componets.dart';


class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Shop App'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              navigateTo(context, SearchScreen());
            },
          ),
        ],
      ),
      body: Container(),

    );
  }
}
