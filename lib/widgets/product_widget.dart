import 'package:flutter/material.dart';
import 'package:gsg/model/product_model.dart';

class ProductWidget extends StatefulWidget {
  @override
  Product _product;
  final Function setFavorite;
  Function isProductFavorite;
  List<Product> products;

  ProductWidget(this._product,
      [this.setFavorite, this.isProductFavorite, this.products]);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  Widget build(BuildContext context) {
    final productId = widget._product.id;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                // blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(0.2, 0.2),
                color: Colors.grey,
              ),
            ],
          ),
        ),
        Positioned(
          top: 10.2,
          left: 9,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  child: Image.network(
                    widget._product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    widget._product.name,
                    //  textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      //  fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "price: ",
                        //  textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15, color: Colors.grey
                            //  fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        widget._product.price,
                        //  textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15, color: Colors.grey
                            //  fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 50,
              ),
              InkWell(
                onTap: () {
                  // setState(() {
                  //   widget._product.isFavorite = !widget._product.isFavorite;
                  //
                  // });
                  //widget.setFavorite(productId);
                  setState(() {
                    if (widget.isProductFavorite(widget._product)) {
                      widget.products.add(widget._product);
                    } else {
                      widget.products.remove(widget._product);
                    }
                  });

                },
                child: Icon(
                  widget.isProductFavorite(widget._product)
                      ? Icons.favorite
                      : Icons.favorite_border,

                  //widget.isProductFavorite(productId) ? Icon( Icons.favorite
                  // ,size: 30,
                  //color:
                  //widget.isProductFavorite(productId) ? Colors.red : Colors.grey,

                  // widget._product.isFavorite ? Colors.red : Colors.grey,
                  // ): Icon(Icons.favorite_border),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
