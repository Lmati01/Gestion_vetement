import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'ClothesListPage.dart';
import 'CartPage.dart';
import 'add_clothes_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final String _login = 'User123';
  String _password = 'password123';
  String _birthday = '01/01/1990';
  String _address = '123 Main Street';
  String _postalCode = '12345';
  String _city = 'Sample City';

  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Login (readonly)
              TextFormField(
                initialValue: _login,
                readOnly: true,
                decoration: const InputDecoration(labelText: 'Login'),
              ),

              // Password (obfuscated)
              TextFormField(
                initialValue: _password,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Mot de passe'),
                onChanged: (value) {
                  _password = value;
                },
              ),

              // Birthday
              TextFormField(
                initialValue: _birthday,
                decoration: const InputDecoration(labelText: 'Anniversaire'),
                onChanged: (value) {
                  _birthday = value;
                },
              ),

              // Address
              TextFormField(
                initialValue: _address,
                decoration: const InputDecoration(labelText: 'Adresse'),
                onChanged: (value) {
                  _address = value;
                },
              ),

              // Postal Code (numeric keyboard)
              TextFormField(
                initialValue: _postalCode,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Code postal'),
                onChanged: (value) {
                  _postalCode = value;
                },
              ),

              // City
              TextFormField(
                initialValue: _city,
                decoration: const InputDecoration(labelText: 'Ville'),
                onChanged: (value) {
                  _city = value;
                },
              ),

              const SizedBox(height: 20),

              // Valider button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Modifications enregistrées')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffBB86FC),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Valider'),
              ),
              const SizedBox(height: 10),

              // Ajouter Vêtement button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AddClothesPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff03DAC6),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Ajouter Vêtement'),
              ),
              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage(title: 'Login')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffCF6679),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Se Déconnecter'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ClothesListPage()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
              break;

          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Acheter'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Panier'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
