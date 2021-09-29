import 'package:flutter/material.dart';

class BuildChip extends StatefulWidget {
  final Color bgColor ;
  final Color selectedBgColor;
  final Color fontColor;
  final Color selectedFontColor;
  final double notifSize = 20.0;
  final int? notifCount;
  final Color notifColor;
  final Color notifTextColor;
  final Color selectedNotif;
  final double borderRadius = 30.0;
  final bool selected;
  final double chipWidth = 110.0;
  final double chipHeight = 40.0;
  final Function setSelected;
  final String label;
  final int id;

  const BuildChip({
    Key? key,
    required this.selectedBgColor,
    required this.fontColor,
    required this.selectedFontColor,
    required this.label,
    required this.bgColor,
    required this.selectedNotif,
    required this.setSelected,
    required this.selected,
    this.notifCount,
    required this.id,
    required this.notifColor,
    required this.notifTextColor,


  }) : super(key: key);

  @override
  _BuildChipState createState() => _BuildChipState();
}

class _BuildChipState extends State<BuildChip> {

  @override
  Widget build(BuildContext context) {



    return GestureDetector(
      onTap: () {
        print("Clicked chip");
        widget.setSelected({'id':widget.id, 'selected':!widget.selected});
      },

        child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 8.0, top: 18.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Positioned(child: Container(
              decoration: BoxDecoration(
                color:  widget.selected ?  widget.selectedBgColor: widget.bgColor,
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              width: widget.chipWidth,
              height: widget.chipHeight,
              child: Center(
                child: Text(
                  widget.label,
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(fontWeight: FontWeight.w900, fontSize: 15, color: widget.selected ? widget.selectedFontColor: widget.fontColor),
                ),
              ),
            )),
            _displayNotif(),
          ],
        ),
      ),
    );
  }

  Widget _displayNotif() {
    if (widget.notifCount != null)  {
      return Positioned(
        top: -5,
        right: -3,
        child: Container(
          decoration: BoxDecoration(
            color: widget.selected ? widget.selectedNotif: widget.notifColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),

          width: widget.notifSize,
          height: widget.notifSize,
          child: Center(
            child: Text(
              widget.notifCount.toString(),
              textAlign: TextAlign.center,
              style:
              TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 11,
                  color: widget.notifTextColor),
            ),
          ),
        ),
      );

    }else {
      return Container();
    }
  }
}
