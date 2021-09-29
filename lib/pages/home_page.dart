import 'package:demo_02/pages/row_menu.dart';
import 'package:demo_02/pages/row_scroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() =>  _HomePageState();
}


class _HomePageState extends State<HomePage> {
  String _containerText = "Cliquez sur les onglets ci-dessus pour voir vos plans";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.yellow,
              Colors.redAccent,
            ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          top: true,
          bottom: true,
          right: true,
          left: true,
          child: Column(
            children: [
              Container(
                  width: 400,
                  height: 50,
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0, top: 10.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 25.0,
                      ),
                    ),
                  ),
              ),
              Container(
                width: 300,
                height: 130,
                color: Colors.transparent,
                child: Text(
                  "Ampoule à changer",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w300,
                      fontSize: 50,
                      color: Colors.white),
                ),
              ),
              Container(
                width: 200,
                height: 50,
                color: Colors.transparent,
                child: Text(
                  "Demande n°82737473 envoyée le 02/05/2021",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Colors.white),
                ),
              ),
            RowMenu(
              initialValue: _containerText,
              emitValue: (String value) {
                _getEmittedValue(value);
              },
            ), // Row Menu
              Container(
                margin: const EdgeInsets.only(top: 40.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(62, 62, 62, 0.4588235294117647),
                        offset: Offset(0.0, 11.0),
                        blurRadius: 30.0,
                        spreadRadius: 0.0,
                      )
                    ],
                ),
                width: 300,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Text(
                        _containerText, //containerText
                        textAlign: TextAlign.left,
                        style:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
                      ),
                      width: 150,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      height: 40,
                      width: 40,
                      child: const Icon(Icons.access_time_rounded),
                    ),
                  ],
                ),
              ),
              RowScroller(),
            ],
          ),
        ),
      ),
    );
  }

  _getEmittedValue(String emittedValue) {
      setState(() {
        _containerText = emittedValue;
      },
    );
  }
}



