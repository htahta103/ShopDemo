part of 'sign_up_screen.dart';

class MostInterested extends StatefulWidget {
  MostInterested({Key? key}) : super(key: key);

  @override
  _MostInterestedState createState() => _MostInterestedState();
}

class _MostInterestedState extends State<MostInterested> {
  bool? isWomenswearSelected;
  bool? isMenswearSelected;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        RichText(
          text: TextSpan(
            text: 'Mostly interested in (Optional):',
            style: TextStyle(
              fontFamily: defaultFont,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color.fromRGBO(100, 100, 100, 1),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(5, 0, 15, 0),
          height: 60,
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
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CustomCheckbox(
                      height: 20,
                      width: 20,
                      borderRadius: 45,
                      onChanged: (bool ischecked) {
                        if (ischecked) {
                          isWomenswearSelected = true;
                          isMenswearSelected = false;
                        } else {
                          isWomenswearSelected = false;
                        }
                        setState(() {});
                      },
                      value: isWomenswearSelected == true,
                    ),
                    Text('Womenswear'),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CustomCheckbox(
                          height: 20,
                          width: 20,
                          borderRadius: 45,
                          onChanged: (bool ischecked) {
                            if (ischecked) {
                              isWomenswearSelected = false;
                              isMenswearSelected = true;
                            } else {
                              isMenswearSelected = false;
                            }
                            setState(() {});
                          },
                          value: isMenswearSelected == true,
                        ),
                        Text('Menswear'),
                      ]),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
