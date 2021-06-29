import 'package:flutter/material.dart';
import 'package:gsg/model/product_model.dart';
import 'package:gsg/widgets/product_widget.dart';


class FavoriteScreen extends StatelessWidget {

  final List<Product> favoriteProducts ;

  const FavoriteScreen(this.favoriteProducts) ;

  @override
  Widget build(BuildContext context) {

    if(favoriteProducts.isEmpty){
      return Center(
        child: Text("you have no favorites yet..."),
      );
    }
    else{
      return ListView.builder(
        itemCount: favoriteProducts.length,
        itemBuilder: (context ,index){
          return ProductWidget(favoriteProducts[index]);
        }
      );


    // return  SingleChildScrollView(
    //   child: Column(
    //     children: favoriteProducts.map((e) {
    //       if(favoriteProducts.length ==0){
    //         return Text('null');
    //       }else {
    //         return ProductWidget(e);
    //       }
    //     }).toList(),
    //
    //   ),
    // );

  }
}

  }


