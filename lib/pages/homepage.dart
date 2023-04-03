import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final int days = 30;

  final String name = "shashank";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decoderData = jsonDecode(catalogJson);
    var productData = decoderData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 18,
                    crossAxisSpacing:18, 
                  ),
                  itemBuilder: (context, index) {
                    final Item = CatalogModel.items[index];
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular( 10)
                        ),
                      child: GridTile(
                        header: Container(
                          child: Text(
                            Item.name, 
                            style: TextStyle(color: Colors.white
                            ),),
                          padding: const EdgeInsets.all(12),
                          decoration:  BoxDecoration(
                            color: Colors.deepPurple,
                          ) ,
                        ),
                        child: Image.network(Item.image),
                        footer:  Container(
                          child: Text(
                            Item.price.toString(),
                            style: TextStyle(color: Colors.white
                            ),),
                          padding: const EdgeInsets.all(12),
                          decoration:  BoxDecoration(
                            color: Colors.black,
                          ) ,
                        ),
                        ));
                  },
                  itemCount: CatalogModel.items.length,
                )
              // listView and gridView both are used in this app you can choose in anyone one
              // ?ListView.builder(
              //   itemCount: CatalogModel.items.length,
              //   itemBuilder: (context, index) =>
              //      ItemWidget(
              //       item: CatalogModel.items[index],
              //     ),
              // )
              : Center(
                  child: CircularProgressIndicator(),
                )),
      drawer: MyDrawer(),
    );
  }
}
