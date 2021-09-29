import 'package:demo_02/widgets/chip.dart';
import 'package:flutter/material.dart';

class RowScroller extends StatefulWidget {
  const RowScroller({Key? key}) : super(key: key);

  @override
  _RowScrollerState createState() => _RowScrollerState();
}

class _RowScrollerState extends State<RowScroller> {

  List _list = [
    {'id': 0, 'label':'En cours', 'notifCount': 2},
    {'id': 1, 'label':'À clôturée', 'notifCount': 5},
    {'id': 2, 'label':'Clôturée', 'notifCount': null},
    {'id': 3, 'label':'En cours', 'notifCount': 8},
    {'id': 4, 'label':'À clôturée', 'notifCount': 1},
    {'id': 5, 'label':'Clôturée', 'notifCount': null},
  ];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 70,
        child: ListView(
          scrollDirection: Axis.horizontal,
            children: _buildChips(),
        ),


      ),
    );
  }

  List<Widget> _buildChips()
  {
    List<Widget> _chips = [];

    for (int i=0; i < _list.length; i++) {
      BuildChip buildChip = BuildChip(
        bgColor: Colors.white54,
        selectedBgColor: Colors.black,
        fontColor: Colors.black,
        selectedFontColor: Colors.white,
        label: _list[i]['label'],
        selectedNotif: Color.fromRGBO(255, 211, 25, 1.0),
        setSelected: (value) {

        },
        selected: false,
        id: _list[i]['id'],
        notifTextColor: Colors.black,
        notifColor: Colors.white,
        notifCount: _list[i]['notifCount'],
      );

      _chips.add(buildChip);
    }
    return _chips;
  }
}
