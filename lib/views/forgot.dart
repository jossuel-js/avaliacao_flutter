import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

class myforgotpage extends StatefulWidget {
  const myforgotpage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<myforgotpage> createState() => _myforgotpageState();

}
  TextEditingController forgot_controller = TextEditingController();

class _myforgotpageState extends State<myforgotpage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
            options: const ParticleOptions(
              spawnMaxRadius: 50,
              spawnMinSpeed: 10.00,
              particleCount: 68,
              spawnMaxSpeed: 50,
              minOpacity: 0.0,
              spawnOpacity: 0.0,
              baseColor: Color.fromARGB(255, 0, 0, 0),
              maxOpacity: 1,
              opacityChangeRate: 0.25,
              image: Image(image: AssetImage('assets/images/ifpiemovebg.png')),
            ),
          ),
          vsync: this,
          child: Form(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Insira seu email',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      icon: Icon(
                        Icons.mail,
                        color: Colors.black,
                      ),
                      errorStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                      hintStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    controller:forgot_controller,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    child: Text('Enviar'),
                    onPressed: () {Navigator.pushNamed(context, '/insert_token');},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black, 
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
