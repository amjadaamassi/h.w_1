import 'package:flutter/material.dart';
import 'package:gsg/model/my_model.dart';

class SliderWidget extends StatelessWidget {
  ModelSlider _modelSlider;

  SliderWidget(this._modelSlider);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10, left: 15, bottom: 20, top: 20),
          height: 200,
          width: 330,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              _modelSlider.image,
              fit: BoxFit.cover,
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 1,
                  offset: Offset(0.2, 0.2),
                  color: Colors.grey,
                ),
              ]),
        ),
        Positioned(
          top: 190,
          left: 15,
          child: Container(
            height: 30,
            width: 330,
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Text(
              _modelSlider.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
