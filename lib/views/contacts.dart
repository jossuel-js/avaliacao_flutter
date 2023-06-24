import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<Contact> contacts = [
    Contact('John Doe', '+1 123-456-7890', 'asf', 'asd'),
    Contact('John Doe', '+1 123-456-7890', 'asf', 'asd'),
    Contact('John Doe', '+1 123-456-7890', 'asf', 'asd'),

    // Adicione mais contatos aqui
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final newContact = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddContactScreen()),
              );
              if (newContact != null) {
                setState(() {
                  contacts.add(newContact);
                });
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return Expanded(
            child: ListTile(
              title: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 15),
                  ),
                  Text(
                    (contacts[index].name),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 17, 17, 17),
                    ),
                  ),
                  // Restante dos itens
                ],
              ),
              subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(contacts[index].email),
                    Text(contacts[index].latitude),
                    Text(contacts[index].longitude),
                    
                  ]),
              leading: Icon(Icons.contact_page),
              onTap: () {
                // Lógica do onTap
              },
            ),
          );
        },
      ),
    );
  }
}

class AddContactScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController latiController = TextEditingController();
  TextEditingController longiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: latiController,
              decoration: InputDecoration(
                labelText: 'Latitude',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: longiController,
              decoration: InputDecoration(
                labelText: 'Longitude',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String email = emailController.text;
                String latitude = latiController.text;
                String longitude = longiController.text;
                Contact newContact = Contact(name, email, latitude, longitude);

                Navigator.pop(context, newContact);
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

class Contact {
  final String name;
  final String email;
  final String latitude;
  final String longitude;

  Contact(this.name, this.email, this.latitude, this.longitude);
}
