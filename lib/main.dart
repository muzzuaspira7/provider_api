// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:provider_api/provider.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) => NumbersListProvider(),
//         )
//       ],
//       child: const MaterialApp(
//         home: MyHome(),
//       ),
//     );
//   }
// }

// class MyHome extends StatefulWidget {
//   const MyHome({super.key});

//   @override
//   State<MyHome> createState() => _MyHomeState();
// }

// class _MyHomeState extends State<MyHome> {
//   List numbers = [1, 2, 3, 4, 5];
//   var last = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Provider one'),
//       ),
//       body: Consumer<NumbersListProvider>(
//         builder: (context, numListModel, child) => Column(children: [
//           Text(numListModel.numbers.last.toString()),
//           Container(
//             height: 600,
//             child: ListView.builder(
//               itemCount: numListModel.numbers.length,
//               itemBuilder: (context, index) {
//                 return Text(numListModel.numbers[index].toString());
//               },
//             ),
//           ),
//           Text(numListModel.getVal()),
//           ElevatedButton(
//               onPressed: () {
//                 numListModel.add();
//               },
//               child: Text('Add'))
//         ]),
//       ),
//     );
//   }
// }

// Cart one

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) => CartProvider(),
//         )
//       ],
//       // create: (context) => CartProvider(),
//       child: MaterialApp(
//         title: 'Shopping Cart App',
//         home: ShoppingCartScreen(),
//       ),
//     );
//   }
// }

// class ShoppingCartScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Mentioning cart provider here
//     var cartProvider = Provider.of<CartProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shopping Cart'),
//       ),
//       body: ListView.builder(
//         itemCount: cartProvider.items.length,
//         itemBuilder: (context, index) {
//           var product = cartProvider.items[index];
//           return ListTile(
//             title: Text('${product.name + 1.toString()}'),
//             subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
//             trailing: IconButton(
//               icon: Icon(Icons.remove),
//               onPressed: () {
//                 print(product.id);
//                 print(product.name);
//                 cartProvider.removeItem(product);
//               },
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           var newProduct = Product(
//             id: DateTime.now().toString(),
//             name: 'New Product',
//             price: 9.99,
//           );
//           cartProvider.addItem(newProduct);
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// // Creating model, so that wherever we use Products it will ask this 3 of them
// class Product {
//   final String id;
//   final String name;
//   final double price;

//   Product({
//     required this.id,
//     required this.name,
//     required this.price,
//   });
// }

// // This class is for provider
// class CartProvider extends ChangeNotifier {
//   // Defining a list named as items
//   List<Product> _items = [];
//   // Getting the list and storing in items
//   List<Product> get items => _items;
//   // Logic to add item
//   void addItem(Product product) {
//     _items.add(product);
//     notifyListeners();
//   }

//   // Logic to remove item
//   void removeItem(Product product) {
//     _items.remove(product);
//     notifyListeners();
//   }
// }

// Counter app without using the builder

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) => counterProvider(),
//         )
//       ],
//       // create: (context) => CartProvider(),
//       child: MaterialApp(
//         title: 'Counter App',
//         home: counterScreen(),
//       ),
//     );
//   }
// }

// class counterScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Mentioning cart provider here
//     var countProvider = Provider.of<counterProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Counter App'),
//       ),
//       body: countProvider.numbers.length > 0
//           ? ListView.builder(
//               itemCount: countProvider.numbers.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text('${countProvider.numbers[index].toString()}'),
//                   trailing: IconButton(
//                     icon: Icon(Icons.remove),
//                     onPressed: () {
//                       countProvider.remove(index);
//                     },
//                   ),
//                 );
//               },
//             )
//           : SizedBox(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // var newProduct = Product(
//           //   id: DateTime.now().toString(),
//           //   name: 'New Product',
//           //   price: 9.99,
//           // );
//           countProvider.add();
//           // countProvider.addItem(newProduct);
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// // Creating model, so that wherever we use Products it will ask this 3 of them
// class Product {
//   final String id;
//   final String name;
//   final double price;

//   Product({
//     required this.id,
//     required this.name,
//     required this.price,
//   });
// }

// // This class is for provider
// class counterProvider extends ChangeNotifier {
//   // Defining a list named as items
//   // List<Product> _items = [];
//   // // Getting the list and storing in items
//   // List<Product> get items => _items;
//   // // Logic to add item
//   // void addItem(Product product) {
//   //   _items.add(product);
//   //   notifyListeners();
//   // }

//   // // Logic to remove item
//   // void removeItem(Product product) {
//   //   _items.remove(product);
//   //   notifyListeners();
//   // }
//   List<int> numbers = [];
//   void add() {
//     int last = numbers.last;

//     numbers.add(last + 1);

//     notifyListeners();
//   }

//   void remove(index) {
//     numbers.remove(index);
//     notifyListeners();
//   }
// }

// API Integration
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api/View/post_provider.dart';

import 'View/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PostProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Counter App',
        home: HomePage(),
      ),
    );
  }
}
