import 'package:flutter/material.dart';

class ChipWithNotif extends StatefulWidget {

  final Color bgColor ;
  final Color selectedBgColor;
  final Color fontColor;
  final Color selectedFontColor;
  final double notifSize = 20.0;
  final int notifCount;
  final Color notifColor;
  final Color notifTextColor;
  final Color selectedNotif;
  final double borderRadius = 30.0;
  final bool selected = false;
  final double chipWidth = 110.0;
  final double chipHeight = 40.0;
  final String label;

  const ChipWithNotif({
    Key? key,
    required this.selectedBgColor,
    required this.fontColor,
    required this.selectedFontColor,
    required this.notifCount,
    required this.label,
    required this.bgColor,
    required this.notifColor,
    required this.selectedNotif,
    required this.notifTextColor,


  }) : super(key: key);

  @override
  _ChipWithNotifState createState() => _ChipWithNotifState();
}

class _ChipWithNotifState extends State<ChipWithNotif> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    String _text;
    _text = widget.notifCount.toString();
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = true;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 8.0, top: 18.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Positioned(child: Container(
              decoration: BoxDecoration(
                color:  _isSelected ?  widget.selectedBgColor: widget.bgColor,
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              width: widget.chipWidth,
              height: widget.chipHeight,
              child: Center(
                child: Text(
                  widget.label,
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(fontWeight: FontWeight.w900, fontSize: 15, color: _isSelected ? widget.selectedFontColor: widget.fontColor),
                ),
              ),
            )),
            Positioned(
              top: -5,
              right: -3,
              child: Container(
                decoration: BoxDecoration(
                  color: _isSelected ? widget.selectedNotif: widget.notifColor,
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),

                width: widget.notifSize,
                height: widget.notifSize,
                child: Center(
                  child: Text(
                    _text,
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 11,
                        color: widget.notifTextColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
