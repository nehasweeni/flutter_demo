import 'package:demo_02/widgets/chip.dart';
import 'package:demo_02/widgets/chip_with_notif.dart';
import 'package:flutter/material.dart';


class RowMenu extends StatefulWidget{
  final String initialValue;
  final Function(String) emitValue;

  const RowMenu({
    Key? key,
    required this.initialValue,
    required this.emitValue,

  }) : super(key: key);

  @override
  _RowMenuState createState() => _RowMenuState();


}

class _RowMenuState extends State<RowMenu> {

  @override
  void initState() {
    super.initState();

  }

  int _selectedIndex = -1;

  List _list = [
    {'id': 0, 'label':'En cours', 'notifCount': 2},
    {'id': 1, 'label':'À clôturée', 'notifCount': 5},
    {'id': 2, 'label':'Clôturée', 'notifCount': null},
  ];

  List _containerMessage = [
    {'id': 0, 'message':'Plannification'},
    {'id': 1, 'message':'Procedure'},
    {'id': 2, 'message':'Travaux Completés'},

  ];

  @override
  Widget build(BuildContext context) {

    return Row(

      children:  _buildChips()

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
          setState(() {
            if(value['selected']) {
              for (int x = 0; x < _containerMessage.length; x++) {

                if (value['id'] == _containerMessage[x]['id']) {
                  _onEmitValue(x) ;
                }
              }
              _selectedIndex = i;
            }
          });
        },
        selected: _selectedIndex == i,
        id: _list[i]['id'],
        notifTextColor: Colors.black,
        notifColor: Colors.white,
        notifCount: _list[i]['notifCount'],
      );

      _chips.add(buildChip);
    }
    return _chips;
  }
  _onEmitValue(int id) {
    for (int x = 0; x < _containerMessage.length; x++) {
      var text = _containerMessage[x]['message'];
      if (id == _containerMessage[x]['id']) {
        widget.emitValue(text);
      }

    }

  }

}