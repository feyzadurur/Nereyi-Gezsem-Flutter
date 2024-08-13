import 'package:flutter/material.dart';

class AnaMenuAltBar extends StatelessWidget {
  const AnaMenuAltBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.teal.shade700,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Icon(
            Icons.home,
            color: Colors.white,
            size: 32,
          ),
          Icon(
            Icons.add_box,
            color: Colors.white,
            size: 32,
          ),
          Icon(
            Icons.message_outlined,
            color: Colors.white,
            size: 32,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
            size: 32,
          ),

        ],
      ),
    );
  }
}
