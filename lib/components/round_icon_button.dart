import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {

  final IconData icon;
  final Function onPressed;

  const RoundIconButton({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(1000.0),
      ),
       //

      child: RawMaterialButton(

        elevation: 0.0,
        child: Icon(icon),
        onPressed: onPressed,
        constraints: BoxConstraints.tightFor(
          height: 56.0,
          width: 56.0,
        ),
        shape: CircleBorder(),
        fillColor: Colors.white,

      ),
    );
  }
}