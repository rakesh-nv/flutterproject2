import 'package:flutter/material.dart';

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
    );
  }
}

class Box extends StatelessWidget {
  const Box({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 200,
      width: 200,
      padding: const EdgeInsets.all(10),
      child: Container(
        color: Colors.grey,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(2)
        // ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryTile({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            child: Icon(icon, size: 30),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String price;

  const ProductCard(
      {super.key,
      required this.imageUrl,
      required this.productName,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Column(
        children: [
          Image.network(imageUrl, height: 120, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productName,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(price, style: const TextStyle(color: Colors.green)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
