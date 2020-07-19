    //product form dart file
    
/*
import 'package:aprender_haciendo_app/src/pruebaProductos/categoryModel.dart';
import 'package:aprender_haciendo_app/src/pruebaProductos/productoModel.dart';
import 'package:aprender_haciendo_app/src/pruebaProductos/productoProvider.dart';
import 'package:aprender_haciendo_app/src/pruebaProductos/productosApi.dart';
import 'package:flutter/material.dart';


import 'categoryProvider.dart';

    class ProductForm extends StatefulWidget {
      final bool isUpdating;

      ProductForm({@required this.isUpdating});

      @override
      _ProductFormState createState() => _ProductFormState();
    }

    class _ProductFormState extends State<ProductForm> {
      final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
      final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

      ProductModel _currentProduct;
      CategoryModel _categoryDropdownValue;
      List<CategoryModel> _categoryTempList=[];

      @override
      void initState() {
        super.initState();
        ProductProvider productProvider = Provider.of<ProductProvider>(context, listen: false);
        CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
          getCategories(categoryProvider);

        if (productProvider.currentProduct != null) {
          _currentProduct = productProvider.currentProduct;
        } else {
          _currentProduct = new ProductModel();
        }
      }
      Widget _buildIdField() {
        return TextFormField(
          decoration: InputDecoration(labelText: 'Brand ID'),
          initialValue: _currentProduct.id,
          keyboardType: TextInputType.text,
          style: TextStyle(fontSize: 20),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Product ID is required';
            }

             return null;
          },
          onSaved: (String value) {
            _currentProduct.id = value;
          },
        );
      }
      Widget _buildNameField() {
        return TextFormField(
          decoration: InputDecoration(labelText: 'Product name'),
          initialValue: _currentProduct.name,
          keyboardType: TextInputType.text,
          style: TextStyle(fontSize: 20),
          onSaved: (String value) {
            _currentProduct.name = value;
          },
        );
      }
      Widget _buildCategoryField() {
        CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);

        return DropdownButtonFormField<CategoryModel>(
              hint: Text('Select category'),
              value: _categoryDropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),

              onChanged: (CategoryModel newValue) {
                setState(() {
                  _categoryDropdownValue = newValue;
                });
              },
              items: categoryProvider.categoryList.map<DropdownMenuItem<CategoryModel>>((CategoryModel value) {
                return DropdownMenuItem<CategoryModel>(
                  value: value,
                  child: Text(value.name), 
                   );}
                  ).toList(),
              // onSaved: (CategoryModel value){
              //   _currentProduct.categories= _categoryTempList;
              //   print('save categories at dropdownmenu');
              // },
         );
       }

      _addCategories(CategoryModel category) {
        if (category!=null ){
          setState(() {
              _categoryTempList.add(category);
          });
        }
      }  
      _onProductUploaded(ProductModel product) {
        ProductProvider productProvider = Provider.of<ProductProvider>(context, listen: false);
        productProvider.addProduct(product);
        Navigator.pop(context);
      }

      _saveProduct() {
        print('saveProduct Called');
        if (!_formKey.currentState.validate()) {
          return;
        }

        _formKey.currentState.save();
        _currentProduct.categories= _categoryTempList ;
        print('form saved');

        uploadProduct(_currentProduct, widget.isUpdating, _onProductUploaded);
      }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(title: Text('Product Form')),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Form(
              key: _formKey,
              autovalidate: true,
              child: Column(children: <Widget>[
                Text(
                  widget.isUpdating ? "Edit Product" : "Create Product",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 16),
            _buildIdField(),
                _buildNameField(),
                _buildCategoryField(),
             ButtonTheme(
                    child: RaisedButton(
                        child: Text('Add', style: TextStyle(color: Colors.white)),
                        onPressed: () => _addCategories(_categoryDropdownValue), 
                  ),),
                GridView.count(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(8),
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  children: _categoryTempList
                      .map(
                        (CategoryModel value) => Card(
                          color: Colors.black54,
                          child: Center(
                            child: Text(
                              value.name,
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ]),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              FocusScope.of(context).requestFocus(new FocusNode());
              _saveProduct();
            },
            child: Icon(Icons.save),
            foregroundColor: Colors.white,
          ),
        );
      }
    } */