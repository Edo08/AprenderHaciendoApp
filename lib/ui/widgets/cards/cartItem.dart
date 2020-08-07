import 'package:flutter/material.dart';

final TextStyle nameStyle = TextStyle(
  fontSize: 16,
  fontFamily: "Poppins-Bold",
);
final TextStyle precioStyle = TextStyle(
  fontSize: 16,
  fontFamily: "Muli",
);
final TextStyle totalStyle = TextStyle(
    fontSize: 26, fontFamily: "Poppins-Bold", fontWeight: FontWeight.bold);
final TextStyle subtotalStyle = TextStyle(
  fontSize: 24,
  fontFamily: "Poppins-Bold",
);
final TextStyle subtotalPrecioStyle =
    TextStyle(fontSize: 22, fontFamily: "Muli", fontWeight: FontWeight.bold);
final TextStyle totalprecioStyle =
    TextStyle(fontSize: 24, fontFamily: "Muli", fontWeight: FontWeight.w800);
final TextStyle confirmarStyle =
    TextStyle(fontSize: 16, fontFamily: "Poppins-Medium", color: Colors.white);

GlobalKey<FormState> keyForm = new GlobalKey();
TextEditingController codigoCtrl = new TextEditingController();

class CartItem extends StatelessWidget {
  const CartItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.lightBlue[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Container(
                  width: 110,
                  height: 110,
                  padding: EdgeInsets.all(4.0),
                  child: Image.network(
                    "https://firebasestorage.googleapis.com/v0/b/aprender-haciendo-app.appspot.com/o/lego-spike.png?alt=media&token=c0e0a7b6-aead-462f-a904-07386aea29d1",
                    fit: BoxFit.contain,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFF65a6f4), Color(0xFF25cfff)],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 8),
                        blurRadius: 8,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 160,
                    child: Text(
                      "Spike Prime",
                      style: nameStyle,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF0074c9),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                        onTap: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "1",
                          style: nameStyle,
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF65c6f4),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                        onTap: () {},
                      ),
                      Spacer(),
                      Text(
                        "₡" + "320 630",
                        style: precioStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
