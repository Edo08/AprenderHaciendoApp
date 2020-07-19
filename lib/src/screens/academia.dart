import 'package:aprender_haciendo_app/src/services/productosApi.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Academia extends StatefulWidget {
  @override
  _AcademiaState createState() => _AcademiaState();
}

class _AcademiaState extends State<Academia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: ListPage(),
      /* SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(0),
                    left: ScreenUtil().setWidth(50),
                    right: ScreenUtil().setWidth(50)),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("LEGO® Education Academy Training",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins-Bold",
                        fontSize: 26,
                        fontWeight: FontWeight.w700)),
              ),
            ]))); */
    );
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

Future _data;

class _ListPageState extends State<ListPage> {
  navigateToDetail(DocumentSnapshot product) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(
                  product: product,
                )));
  }

  @override
  void initState() {
    super.initState();
    _data = getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: _data,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("Cargando..."),
              );
            } else {
              return ListView.builder(
                  //scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(30),
                        ),
                        child: ListTile(
                          title: Text(snapshot.data[index].data["nombre"]),
                          onTap: () => navigateToDetail(snapshot.data[index]),
                        ));
                  });
            }
          }),
    );
  }
}

class DetailPage extends StatefulWidget {
  final DocumentSnapshot product;

  DetailPage({this.product});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title:widget.product.data["nombre"]
          ),
      body: Container(
        child: Card(
          child: ListTile(
            title: Text(widget.product.data["nombre"]),
            subtitle: Text(widget.product.data["image"]),
          ),
        ),
      ),
    );
  }
}
