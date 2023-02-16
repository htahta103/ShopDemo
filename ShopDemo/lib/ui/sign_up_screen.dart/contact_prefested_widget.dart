part of 'sign_up_screen.dart';

class ContactPrefested extends StatefulWidget {
  @override
  _ContactPrefestedState createState() => _ContactPrefestedState();
}

class _ContactPrefestedState extends State<ContactPrefested> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 15, 12, 0),
      margin: EdgeInsets.only(top: 20),
      height: 350,
      width: 335,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 16,
            offset: Offset(2, 4), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Contact prefested in',
                style: TextStyle(
                    fontFamily: defaultFont, fontWeight: FontWeight.w600),
              ),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(218, 43, 43, 1),
                  shape: BoxShape.circle,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Tell us which email you'd like:",
            style: TextStyle(
              fontFamily: defaultFont,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(100, 100, 100, 1),
            ),
          ),
          ItemCheckBox(
            title: 'Discounts and sales',
          ),
          ItemCheckBox(
            title: 'New stuff',
          ),
          ItemCheckBox(
            title: 'Your exclusives',
          ),
          ItemCheckBox(
            title: 'App partners',
          ),
          SizedBox(height: 15,),
              Text(
                "Tell me more about these",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: defaultFont,
                  fontSize: 12,
                  color: Color.fromRGBO(157, 158, 163, 1),
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "By creating your account, you agree to our",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: defaultFont,
                  fontSize: 12,
                  color: Color.fromRGBO(157, 158, 163, 1),
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Terms and Conditions & Privacy Policy",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: defaultFont,
                  fontSize: 12,
                  color: Color.fromRGBO(143, 95, 67, 1),
                ),
              ),
        ],
      ),
    );
  }
}

class ItemCheckBox extends StatefulWidget {
  final String title;

  const ItemCheckBox({Key? key, required this.title}) : super(key: key);
  @override
  _ItemCheckBoxState createState() => _ItemCheckBoxState();
}

class _ItemCheckBoxState extends State<ItemCheckBox> {
  var isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            widget.title,
            style: defaultStyleBold,
          ),
          CustomCheckbox(
            margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
            value: isChecked,
            haveBorder: false,
            borderRadius: 5,
            activeColor: Color.fromRGBO(143, 95, 67, 1),
            inactiveColor: Color.fromRGBO(157, 158, 163, 1),
            onChanged: (bool value) {
              isChecked = value;
              setState(() {});
            },
          )
        ],
      ),
    );
  }
}
