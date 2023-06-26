import 'package:flutter/material.dart';


_header(context) {
  return Column(
    children: [
      Image.asset('assets/images/ifpi.jpg'),
      const Padding(padding: EdgeInsets.all(30))
    ],
  );
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
     return WillPopScope(
      onWillPop: () => _exibirAlertaSair(context),
      child: Scaffold(
      appBar: AppBar(
        title: const Text('HOMEPAGE'),
        centerTitle: true,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.logout),
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
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  backgroundColor: const Color.fromARGB(255, 81, 59, 247),
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                ),
                onPressed: (() => {Navigator.pushNamed(context, '/maps')}),
                child: const Text('Contacts'),
              ),
            ),
          ),
          const SizedBox(height: 0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ), backgroundColor: const Color.fromARGB(255, 81, 59, 247),
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                ),
                onPressed: (() => {Navigator.pushNamed(context, '/maps')}),
                child: const Text('Profile'),
              ),
            ),
          ),
          const SizedBox(height: 0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ), backgroundColor: const Color.fromARGB(255, 81, 59, 247),
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                ),
                onPressed: (() => {Navigator.pushNamed(context, '/maps')}),
                child: const Text('Maps'),
              ),
            ),
          ),
          const SizedBox(height: 0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ), backgroundColor: const Color.fromARGB(255, 93, 73, 248),
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                ),
                onPressed: (() => {Navigator.pushNamed(context, '/weather')}),
                child: const Text('Weather'),
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
          title: const Text('Deseja sair?'),
          content: const Text('Tem certeza que deseja sair?'),
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const Text('Sair'),
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


