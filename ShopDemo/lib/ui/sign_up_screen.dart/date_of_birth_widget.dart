part of 'sign_up_screen.dart';

Widget _buildDateOfBirth({bool isRequired = true}) {
  var _currentSelectedValue;
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Date of birth',
                style: TextStyle(
                  fontFamily: defaultFont,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color.fromRGBO(100, 100, 100, 1),
                ),
              ),
              isRequired
                  ? TextSpan(
                      text: '*',
                      style: TextStyle(
                          fontFamily: defaultFont,
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                          color: Colors.red),
                    )
                  : SizedBox(),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        CustomDropdown(),
        Text(
                "You need to be 16 or over to use Ebuy",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: defaultFont,
                  fontSize: 12,
                  color: Color.fromRGBO(157, 158, 163, 1),
                ),
              ),
      ]);
}
