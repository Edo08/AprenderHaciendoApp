import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategorySelector extends StatefulWidget {
  final List<String> categorias;
  CategorySelector({@required this.categorias});
  @override
  _CategorySelectorState createState() => new _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  String categoriaMostrar;
  int _currentIndex = 0;
  bool _isSelected;

  List<Widget> _buildProductsCategories() {
    return widget.categorias.map(
      (categoria) {
        var index = widget.categorias.indexOf(categoria);
        _isSelected = _currentIndex == index;
        return Padding(
          padding: EdgeInsets.only(left: ScreenUtil().setWidth(50)),
          child: GestureDetector(
            onTap: () {
              setState(
                () {
                  _currentIndex = index;
                  if (index == 0) {
                    categoriaMostrar = "Preescolar";
                  } else if (index == 1) {
                    categoriaMostrar = "Primaria";
                  } else if (index == 2) {
                    categoriaMostrar = "Secundaria";
                  } else {
                    categoriaMostrar = "*";
                  }
                },
              );
            },
            child: Text(
              categoria,
              style: TextStyle(
                color: _isSelected ? Colors.black : Colors.grey,
                fontSize: _isSelected ? 22 : 16,
                fontFamily: "Poppins-Medium",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildProductsCategories(),
    );
  }
}
