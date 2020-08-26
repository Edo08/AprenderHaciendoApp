import 'package:aprender_haciendo_app/core/models/comprasModelDB.dart';
import 'package:flutter/material.dart';

final TextStyle numOrdenStyle = TextStyle(
    fontSize: 24,
    fontFamily: "Poppins-Medium",
    color: Colors.black,
    fontWeight: FontWeight.w700);

final TextStyle tituloStyle = TextStyle(
    fontSize: 18,
    fontFamily: "Poppins-Medium",
    color: Colors.black,
    fontWeight: FontWeight.w500);

final TextStyle descripcionProductoStyle = TextStyle(
    fontSize: 18,
    fontFamily: "Poppins-Medium",
    color: Colors.grey,
    fontWeight: FontWeight.w500,);

final TextStyle montoStyle =
    TextStyle(fontSize: 19, color: Colors.grey, fontWeight: FontWeight.w500);

class BodyHistorialDetail extends StatelessWidget {
  final ComprasModelDB historial;

  const BodyHistorialDetail({Key key, this.historial}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // it provide us total height and width
    //Size size = MediaQuery.of(context).size;
    // it enable scrolling on small devices
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                           horizontal: 12),
                      child: Image.asset("images/LogoAH_color.png", height: 100, width: 200,),
                    ),
                  ),                  
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0 / 2),
                    child: Center(
                      child: Text(
                        "Número de compra #" + historial.transactionCode.toString(),
                        style: numOrdenStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 20.0 / 2, horizontal: 12),
                    child: Container(
                      child: Row(children: <Widget>[
                        Text("Fecha: ", style: tituloStyle),
                        Text(
                          historial.fecha.toDate().day.toString()+"/"+
                          historial.fecha.toDate().month.toString()+"/"+
                          historial.fecha.toDate().year.toString(),
                          style: descripcionProductoStyle,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ]),
                    ),
                  ),
                  FittedBox(
                      child: DataTable(
                      columns: [
                        DataColumn(label: Text('Producto', style: tituloStyle)),
                        DataColumn(label: Text('Cantidad', style: tituloStyle)),
                        DataColumn(label: Text('Subtotal', style: tituloStyle)),
                      ],
                      rows: <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text(historial.nombreProducto, style: descripcionProductoStyle,)),
                            DataCell(Text(historial.cantidad.toString(), style: descripcionProductoStyle, textAlign: TextAlign.center,)),
                            DataCell(Text("₡" +historial.total.toString(), style: montoStyle,)),
                          ],
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(children: <Widget>[
                    SizedBox(
                      width: 15,
                    ),
                    Text("Total de la compra: ", style: tituloStyle),
                    Text("₡" + historial.total.toString(), style: montoStyle),
                  ]),
                  SizedBox(
                    height: 25,
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
