import 'package:flutter/material.dart';




class MyHomePage extends StatefulWidget {
  const MyHomePage(String s, {super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // The title text which will be shown on the action bar
          title: const Text("IFPI"),
          backgroundColor:Colors.blue,
          centerTitle: true,
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
              Container(
            margin:
                // ignore: prefer_const_constructors
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: Image.asset('assets/images/ifpi.jpg'),
              ),
              Container(
            margin:
                // ignore: prefer_const_constructors
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.all(40)),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(
                                fontSize: 14, color: Colors.black))),
                    onPressed: null,
                    child: const Text('CONTACTS'),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.all(40)),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(
                                fontSize: 14, color: Colors.white))),
                    onPressed:(() => {Navigator.pushNamed(context, '/maps')}),
                    child: const Text('MAPS'),
                  ),
                ]),
              ),
              Container(
            margin:
                // ignore: prefer_const_constructors
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.all(40)),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(
                                fontSize: 14, color: Colors.black))),
                    onPressed: null,
                    child: const Text('COMMING'),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.all(40)),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(
                                fontSize: 14, color: Colors.black))),
                    onPressed: null,
                    child: const Text('#####'),
                  ),
                ]),
              ),
            ])));
  }
}