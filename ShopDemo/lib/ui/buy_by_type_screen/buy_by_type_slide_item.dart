import 'package:flutter/cupertino.dart';

class BuyByTypeSlideItems extends StatelessWidget {
  final List<String> items;
  BuyByTypeSlideItems({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 10,
        runSpacing: 10,
        children: items.map((content) {
          return BuyByTypeItem(
            content: content,
          );
        }).toList());
  }
}

class BuyByTypeItem extends StatelessWidget {
  final String? content;

  const BuyByTypeItem({Key? key, this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      height: 80,
      width: (MediaQuery.of(context).size.width - 30) / 2,
      color: Color.fromRGBO(239, 239, 239, 1),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Icon(
          CupertinoIcons.rocket,
          size: 30,
        ),
        Text(
          content ?? '',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ]),
    );
  }
}
