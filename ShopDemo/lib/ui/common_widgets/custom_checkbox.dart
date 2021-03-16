import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool value;
  final Function(bool value) onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final Color activeBorderColor;
  final Color inactiveBorderColor;
  final double borderRadius;
  final bool haveIcon;
  final bool haveBorder;
  final EdgeInsetsGeometry margin;
  final double width;
  final double height;

  const CustomCheckbox({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.activeColor = const Color.fromRGBO(143, 95, 67, 1),
    this.inactiveColor = const Color.fromRGBO(157, 158, 163, 1),
    this.borderRadius = 0,
    this.haveIcon = true,
    this.activeBorderColor = const Color.fromRGBO(143, 95, 67, 1),
    this.inactiveBorderColor = const Color.fromRGBO(157, 158, 163, 1),
    this.haveBorder = true,
    this.margin = const EdgeInsets.fromLTRB(10, 0, 10, 0),
    this.height = 28,
    this.width = 28,
  }) : super(key: key);
  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    var _selected = widget.value;
    return InkWell(
      onTap: () {
        setState(() {
          _selected = !_selected;
        });
        widget.onChanged(_selected);
      },
      child: Container(
        margin: widget.margin,
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: _selected ? widget.activeColor : widget.inactiveColor,
          border: Border.all(
              width: widget.haveBorder ? 2 : 0,
              color: _selected
                  ? widget.activeBorderColor
                  : widget.inactiveBorderColor),
        ),
        child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: _selected && widget.haveIcon
                ? new LayoutBuilder(builder: (context, constraint) {
                    return new Icon(Icons.check,
                        color: Colors.white, size: constraint.biggest.height);
                  })
                : Container()),
      ),
    );
  }
}
