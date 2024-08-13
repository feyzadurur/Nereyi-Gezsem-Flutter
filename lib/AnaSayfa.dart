import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_decorator.dart';
import 'package:nereyi_gezsem_bbt/asistan.dart';
import 'package:nereyi_gezsem_bbt/AnaMenuAltBar.dart';
import 'package:nereyi_gezsem_bbt/AppBarDetay.dart';
import 'package:nereyi_gezsem_bbt/AppBarWidget.dart';

class anaSayfa extends StatefulWidget {
  const anaSayfa({super.key});

  @override
  State<anaSayfa> createState() => _anaSayfaState();
}

class _anaSayfaState extends State<anaSayfa> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffF6F4F3),
          body: SingleChildScrollView(
            child: Column(
              children: [
                AppBarWidget(),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Container(
                    width: 350,
                    height: 70,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: Colors.white70, style: BorderStyle.solid)),
                    margin: EdgeInsets.only(top: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      maxLength: 150,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.teal),
                    ),
                    onPressed: ()
                    => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    ),
                    child: Text('SOR!')),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 190,
                        height: 70,
                        child: ListTile(
                          leading: Icon(
                            Icons.bed,
                            color: Colors.black,
                          ),
                          title: Text(
                            "Oteller",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: Colors.white70,
                                style: BorderStyle.solid),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ])),

                    Container(
                        width: 190,
                        height: 70,
                        child: ListTile(
                          leading: Icon(
                            Icons.add_a_photo,
                            color: Colors.black,
                          ),
                          title: Text(
                            "Turistik yerler",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: Colors.white70,
                                style: BorderStyle.solid),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ])),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 190,
                        height: 70,
                        child: ListTile(
                          leading: Icon(
                            Icons.fastfood,
                            color: Colors.black,
                          ),
                          title: Text(
                            "Restoranlar",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: Colors.white70,
                                style: BorderStyle.solid),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ])),
                    Container(
                        width: 190,
                        height: 70,
                        child: ListTile(
                          leading: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.black,
                          ),
                          title: Text(
                            "Marketler",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: Colors.white70,
                                style: BorderStyle.solid),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ])),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 190,
                        height: 70,
                        child: ListTile(
                          leading: Icon(
                            Icons.local_hospital,
                            color: Colors.black,
                          ),
                          title: Text(
                            "Hastaneler",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: Colors.white70,
                                style: BorderStyle.solid),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ])),
                    Container(
                        width: 190,
                        height: 70,
                        child: ListTile(
                          leading: Icon(
                            Icons.attach_money,
                            color: Colors.black,
                          ),
                          title: Text(
                            "ATMLER",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: Colors.white70,
                                style: BorderStyle.solid),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ])),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 190,
                        height: 70,
                        child: ListTile(
                          leading: Icon(
                            Icons.coffee,
                            color: Colors.black,
                          ),
                          title: Text(
                            "Kafeler",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: Colors.white70,
                                style: BorderStyle.solid),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ])),

                    Container(
                        width: 190,
                        height: 70,
                        child: ListTile(
                          leading: Icon(
                            Icons.add_business,
                            color: Colors.black,
                          ),
                          title: Text(
                            "AVMLER",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: Colors.white70,
                                style: BorderStyle.solid),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ])),
                  ],
                ),
              ],
            ),
          ),

          drawer: AppBarDetay(),
          bottomNavigationBar: AnaMenuAltBar(),

        ),
      ),
    );
  }
}
