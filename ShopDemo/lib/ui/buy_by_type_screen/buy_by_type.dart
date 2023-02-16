import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'buy_by_type_slide_item.dart';

class BuyByType extends StatefulWidget {
  @override
  _BuyByTypeState createState() => _BuyByTypeState();
}

class _BuyByTypeState extends State<BuyByType> {
  List<String> titles = [
    'Dress',
    'Shirt',
    'T-Shirt',
    'Pant',
    'Denim',
    'Underwear',
    'Bikini',
    'Set',
    'Sport',
    'Blazers',
    'Bodysuits',
    'Camis',
    'Beauty',
    'Shoes & Bags',
    'accessories',
  ];

  List<Widget> items = [];
  int _current = 0;

  void mapDataToSlideItem() {
    var currentPage = 1;
    var pageNumber = (titles.length / 8).ceil();
    while (currentPage <= pageNumber) {
      if (currentPage < pageNumber) {
        items.add(
          BuyByTypeSlideItems(
            items: titles
                .getRange(8 * (currentPage - 1), 8 * currentPage)
                .toList(),
          ),
        );
      } else if (currentPage == pageNumber) {
        items.add(
          BuyByTypeSlideItems(
            items:
                titles.getRange(8 * (currentPage - 1), titles.length).toList(),
          ),
        );
      }
      currentPage++;
    }
  }

  @override
  void initState() {
    mapDataToSlideItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Text(
            "#BuyByType",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10),
          CarouselSlider(
            items: items,
            options: CarouselOptions(
                enableInfiniteScroll: false,
                height: 360,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: items.map((url) {
              int index = items.indexOf(url);
              return Container(
                width: 20,
                height: 3,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: _current == index
                      ? Colors.black
                      : Color.fromRGBO(239, 239, 239, 1),
                ),
              );
            }).toList(),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
