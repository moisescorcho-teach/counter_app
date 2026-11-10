import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MyButton(
            icon: Icons.plus_one_outlined,
            function: () {
              _counter++;
              setState(() {});
            },
          ),

          SizedBox(height: 8),

          MyButton(
            icon: Icons.exposure_minus_1_outlined,
            function: () {
              setState(() {
                _counter--;
              });
            },
          ),

          SizedBox(height: 8),

          MyButton(
            icon: Icons.refresh_rounded,
            function: () {
              setState(() {
                _counter = 0;
              });
            },
          ),
        ],
      ),
    );
  }

  Container body() {
    return Container(
      color: Colors.blueGrey,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Cantidad de veces pulsado",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            "$_counter",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text("Mi aplicacion", style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.blue,
      actions: [
        IconButton(
          icon: Icon(Icons.refresh_outlined),
          color: Colors.white,
          iconSize: 40,
          onPressed: () {
            setState(() {
              _counter = 0;
            });
          },
        ),
      ],
    );
  }
}

class MyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? function;

  // Version Antigua
  const MyButton({super.key, required this.icon, this.function});

  // Version nueva
  // const new({super.key, required this.icon, this.function});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(40),
      ),
      elevation: 0,
      backgroundColor: Colors.cyan,
      foregroundColor: Colors.white,
      onPressed: function,
      child: Icon(icon),
    );
  }
}
