import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'login_screen.dart';
import 'ClothesListPage.dart';
import 'CartPage.dart';

class ClothesListPage extends StatefulWidget {
  @override
  _ClothesListPageState createState() => _ClothesListPageState();
}

class _ClothesListPageState extends State<ClothesListPage> {
  List<Map<String, dynamic>> clothesList = [];

  @override
  void initState() {
    super.initState();
    fetchClothes();
  }

  void fetchClothes() async {
    clothesList = [
      {
        'image': 'https://images.unsplash.com/photo-1517841905240-472988babdf9',
        'title': 'T-Shirt',
        'size': 'M',
        'price': 19.99,
      },
      {
        'image': 'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f',
        'title': 'Jeans',
        'size': 'L',
        'price': 49.99,
      },
    ];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('COLLECTION'),
        ),
      ),
      body: ListView.builder(
        itemCount: clothesList.length,
        itemBuilder: (context, index) {
          final item = clothesList[index];
          return Card(
            child: ListTile(
              leading: SizedBox(
                width: 80,
                height: 80,
                child: Image.network(
                  item['image'],
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(item['title']),
              subtitle: Text('Taille: ${item['size']} - Prix: \$${item['price']}'),
              onTap: () {
                // Naviguer vers la page de détail du vêtement
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Acheter'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Panier'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
      ),
    );
  }
}
