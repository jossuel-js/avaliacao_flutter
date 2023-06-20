import 'package:flutter/material.dart';


_header(context) {
  return Column(
    children: [
      Image.asset('assets/images/ifpi.jpg'),
      Padding(padding: EdgeInsets.all(30))
    ],
  );
}


class MyHomePage extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
     return WillPopScope(
      onWillPop: () => _exibirAlertaSair(context),
      child: Scaffold(
      appBar: AppBar(
        title: Text('HOMEPAGE'),
        centerTitle: true,
        leading: Row(
          children: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () => _exibirAlertaSair(context),
              
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _header(context),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  backgroundColor: Color.fromARGB(255, 81, 59, 247),
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                ),
                onPressed: (() => {Navigator.pushNamed(context, '/maps')}),
                child: Text('Contacts'),
              ),
            ),
          ),
          SizedBox(height: 0),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  primary: Color.fromARGB(255, 81, 59, 247),
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                ),
                onPressed: (() => {Navigator.pushNamed(context, '/maps')}),
                child: Text('Profile'),
              ),
            ),
          ),
          SizedBox(height: 0),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  primary: Color.fromARGB(255, 81, 59, 247),
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                ),
                onPressed: (() => {Navigator.pushNamed(context, '/maps')}),
                child: Text('Maps'),
              ),
            ),
          ),
          SizedBox(height: 0),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  primary: Color.fromARGB(255, 93, 73, 248),
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                ),
                onPressed: (() => {Navigator.pushNamed(context, '/weather')}),
                child: Text('Weather'),
              ),
            ),
          ),
        ],
      ),
     ));
  }
}


void _voltarPagina(BuildContext context) {
  Navigator.of(context).pushNamed('/login');
}


  Future<bool> _exibirAlertaSair(BuildContext context) async {
    final resultado = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Deseja sair?'),
          content: Text('Tem certeza que deseja sair?'),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text('Sair'),
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
            ),
          ],
        );
      },
    );
    return resultado ?? false;
  }


