import 'package:aprender_haciendo_app/src/widgets/bodyAcademia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Academia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BodyAcademia(),
    );
  }
}
/* class ListPage extends StatefulWidget {
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
} */
