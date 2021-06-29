import 'package:flutter/material.dart';
import 'package:gsg/model/my_model.dart';
import 'package:gsg/widgets/favorite_screen.dart';
import 'package:gsg/widgets/product_widget.dart';
import 'package:gsg/widgets/slider_widget.dart';

import 'data/product_data.dart';
import 'data/slider_data.dart';
import 'model/product_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  int index = 0;
  TabController tabController;

  initTabController() {
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTabController();
  }

 // bool _isProductFavorite = false;
  List <Product> _favoriteProducts = [];

  void _toggleFavorite(String  productId) {
    final existingIndex =
        _favoriteProducts.indexWhere((product) => product.id == productId);
    if (existingIndex >= 0) {
      _favoriteProducts.removeAt(existingIndex);
    } else {
      setState(() {
        _favoriteProducts
            .add(products.firstWhere((product) => product.id == productId));
      });
    }
    // _isProductFavorite =
    //     _favoriteProducts.any((product) => product.id == productId);
  }


  bool _isProductFavorite(Product product){
  return _favoriteProducts.contains(product);

  }





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            SizedBox(
              width: 10,
            ),
            Icon(Icons.search),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.shopping_cart),
          ],
          backgroundColor: Colors.black,
          title: Text("Shop App"),
          bottom: TabBar(
            onTap: (tapedIndex) {
              this.index = tapedIndex;
              tabController.animateTo(tapedIndex);
              setState(() {});
            },
            controller: tabController,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favourite',
              ),
              Tab(
                icon: Icon(Icons.perm_identity),
                text: 'Profile',
              ),
            ],
          ),
        ),
        body: TabBarView(

            // physics: NeverScrollableScrollPhysics(),
            controller: tabController,
            children: [
              Center(
                child: ListView(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: slides.map((e) {
                        return SliderWidget(e);
                      }).toList()),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 15),
                      child: Text(
                        "Products",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: products.map((e) {
                          return ProductWidget(e, _toggleFavorite , _isProductFavorite , _favoriteProducts);
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: FavoriteScreen(_favoriteProducts),
              ),
              Center(
                child: Text('Profile'),
              ),
            ]),
      ),
    );
  }
}

/*
  ListView(
               //crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                   child: Row(
                       children: slides.map((e) {

                         return SliderWidget(e);
                       }).toList()),
                 ),

                 Padding(
                   padding: const EdgeInsets.only(left:15 ,bottom: 15),
                   child: Text("Products" ,
                     textAlign: TextAlign.start,
                     style: TextStyle(
                       fontSize: 30,
                       fontWeight: FontWeight.bold,

                     ),
                   ),
                 ),

                 SingleChildScrollView(
                   child: Column(
                     children:  products.map((e) {
                       return ProductWidget(e);
                     }).toList(),
                   ),
                 ),


               ],
             ),
 */
