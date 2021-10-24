import 'package:flutter/material.dart';

class Dash extends StatefulWidget {
  Dash({Key? key}) : super(key: key);

  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                color:Colors.teal,
                borderRadius:BorderRadius.circular(20),
                boxShadow: [BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  spreadRadius: 5,
                  blurRadius: 10
                )]
              ),
              
            ),
          ),
        ],
      )
    );
  }
}