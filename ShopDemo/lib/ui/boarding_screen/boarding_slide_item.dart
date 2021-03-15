import 'package:flutter/material.dart';

class BoardingSlideItem extends StatelessWidget {
  final SlideItem item;

  const BoardingSlideItem({Key key, @required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            item.image,
            fit: BoxFit.scaleDown,
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            item.title,
            style: TextStyle(fontSize: 20, fontFamily: 'SourceSansPro'),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            item.detail,
            style: TextStyle(fontSize: 14, fontFamily: 'SourceSansPro'),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class SlideItem {
  final String image;
  final String title;
  final String detail;

  SlideItem(
      {@required this.image, @required this.title, @required this.detail});
}
