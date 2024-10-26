import 'package:flutter/material.dart';

import 'constants/Categorys.dart';
import 'constants/cards.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 250,
        child: ListView(
          children: [
            Container(
              height: 100,
              child: DrawerHeader(
                padding: EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(9),
                      child: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                    ),
                    const Text('Rakesh'),
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Text('Mobile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Electronics'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Fashion'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Furniture'),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Row(
          children: [Text('Home')],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          ),
          Container(
            height: 43,
            width: 43,
            margin: EdgeInsets.all(11),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person,
              color: Colors.black,
            ),
          )
        ],
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for products',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          // Categories row
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryTile(icon: Icons.phone_android, label: 'Mobiles'),
                  CategoryTile(icon: Icons.tv, label: 'Electronics'),
                  CategoryTile(icon: Icons.shopping_bag, label: 'Fashion'),
                  CategoryTile(icon: Icons.chair, label: 'Furniture'),
                  CategoryTile(
                      icon: Icons.laptop_chromebook, label: 'Chromebook'),
                  CategoryTile(icon: Icons.book, label: 'Book'),
                  CategoryTile(icon: Icons.mouse, label: 'Mouse'),
                  CategoryTile(icon: Icons.keyboard, label: 'Keyboard'),
                ],
              ),
            ),
          ),

          // Product list
          Expanded(
            // child: ListView.builder(
            //   itemBuilder: (context, index) => SizedBox(
            //     height: 210,
            //     //color: Colors.red,
            //     child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (context, index) => const Box(),
            //     ),
            //   ),
            // ),

            // #################################################################3
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: 8, // Number of products
              itemBuilder: (context, index) {
                return ProductCard(
                  imageUrl: 'https://via.placeholder.com/150',
                  // Placeholder image
                  productName: 'Product $index',
                  price: '\$${(index + 1) * 20}',
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Colors.blue,
        items: const [

          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.black,), label: "Home",),
          BottomNavigationBarItem(icon: Icon(Icons.alarm,color: Colors.black,), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.shop,color: Colors.black,), label: "search"),
        ],
      ),

    );
  }
}





