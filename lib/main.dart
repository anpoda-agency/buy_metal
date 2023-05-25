import 'package:buy_metal_app/firebase_options.dart';
import 'package:buy_metal_app/repo/profile_repository.dart';
import 'package:buy_metal_app/test_pages/test_list_proposals_page.dart';
import 'package:buy_metal_app/ui/pages/auth_pages/auth_page.dart';
import 'package:buy_metal_app/ui/pages/1.2/buyer_orders_list_page.dart';
import 'package:buy_metal_app/ui/pages/1.1/buyer_workplace_page.dart';
import 'package:buy_metal_app/ui/pages/2.4/create_compliance_proposal_page.dart';
import 'package:buy_metal_app/ui/pages/1.7/create_order_page.dart';
import 'package:buy_metal_app/ui/pages/2.5/create_similar_proposal_page.dart';
import 'package:buy_metal_app/ui/pages/2.2/description_of_buyer_order_page.dart';
import 'package:buy_metal_app/ui/pages/1.5/description_of_supplier_proposal_page.dart';
import 'package:buy_metal_app/ui/pages/auth_pages/reg_page.dart';
import 'package:buy_metal_app/ui/pages/2.1.1/selected_buyer_list_of_orders_page.dart';
import 'package:buy_metal_app/ui/pages/2.3/selection_of_create_proposal_page.dart';
import 'package:buy_metal_app/ui/pages/1.6/supplier_contacts_page.dart';
import 'package:buy_metal_app/ui/pages/1.3/suppliers_list_page.dart';
import 'package:buy_metal_app/ui/pages/home_page/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform
      //     options: const FirebaseOptions(
      //   apiKey: 'AIzaSyBoXWzMysUo_Wtwrq4ojjHnmnoNf_XAGNA',
      //   appId: '1:667451689375:android:2e85ac9c87d1a8b38495aa',
      //   messagingSenderId: '667451689375',
      //   projectId: 'anmetal-72487',
      //   storageBucket: 'anmetal-72487.appspot.com',
      // )
      );
  initGetIt().then((value) => runApp(const MyApp()));
  // runApp(const MyApp());
}

Future<void> initGetIt() async {
  GetIt getIt = GetIt.instance;
  var profile = ProfileRepository();
  getIt.registerSingleton<ProfileRepository>(profile);
  User? user =
      FirebaseAuth.instance.currentUser; //поверка на юзера авторизованного
  if (user != null) {
    getIt.get<ProfileRepository>().saveUser(id: user.uid);
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GetIt getIt = GetIt.instance;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider(create: (context) => getIt),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/test_list_proposals_page': (context) =>
              const TestListProposals(), // тестовая страница для предложений

          '/home_page': (context) => const HomePage(), // new 1.0 start page

          '/reg_page': (context) => const RegPage(), // registration

          '/auth_page': (context) => const AuthPage(), //1.0 authorization

          '/buyer_workplace_page': (context) =>
              const BuyerWorkplacePage(), //1.1

          '/buyer_orders_list_page': (context) =>
              const BuyerOrdersListPage(), // 1.2

          '/suppliers_list_page': (context) => const SuppliersListPage(), //1.3

          '/description_of_supplier_proposal_page': (context) =>
              const DescriptionOfSupplierProposalPage(), // 1.5

          '/supplier_contacts_page': (context) =>
              const SupplierContactsPage(), // 1.6

          '/create_order_page': (context) => const CreateOrderPage(), //1.7

          '/selected_buyer_list_of_orders_page': (context) =>
              const SelectedBuyerListOfOrdersPage(), // 2.1.1

          '/description_of_buyer_order_page': (context) =>
              const DescriptionOfBuyerOrderPage(), //2.2

          '/selection_of_create_proposal_page': (context) =>
              const SelectionOfCreateProposalPage(), //2.3

          '/create_compliance_proposal_page': (context) =>
              const CreateComplianceProposalPage(), //2.4

          '/create_similar_proposal_page': (context) =>
              const CreateSimilarProposalPage(), //2.5
        },
        home: getIt.get<ProfileRepository>().user.id.isNotEmpty
            ? getIt.get<ProfileRepository>().user.buyer
                ? const BuyerWorkplacePage()
                : const SelectedBuyerListOfOrdersPage()
            : const MyHomePage(
                title: 'start',
              ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //var repo = GetIt.instance.get<MainRepository>();
    return const HomePage();
  }
}







// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       // Remove the debug banner
//       debugShowCheckedModeBanner: false,
//       title: 'Kindacode.com',
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   // text fields' controllers
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _priceController = TextEditingController();

//   final CollectionReference _productss =
//       FirebaseFirestore.instance.collection('cars');

//   // This function is triggered when the floatting button or one of the edit buttons is pressed
//   // Adding a product if no documentSnapshot is passed
//   // If documentSnapshot != null then update an existing product
//   Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
//     String action = 'create';
//     if (documentSnapshot != null) {
//       action = 'update';
//       _nameController.text = documentSnapshot['name'];
//       _priceController.text = documentSnapshot['price'].toString();
//     }

//     await showModalBottomSheet(
//         isScrollControlled: true,
//         context: context,
//         builder: (BuildContext ctx) {
//           return Padding(
//             padding: EdgeInsets.only(
//                 top: 20,
//                 left: 20,
//                 right: 20,
//                 // prevent the soft keyboard from covering text fields
//                 bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextField(
//                   controller: _nameController,
//                   decoration: const InputDecoration(labelText: 'Name'),
//                 ),
//                 TextField(
//                   keyboardType:
//                       const TextInputType.numberWithOptions(decimal: true),
//                   controller: _priceController,
//                   decoration: const InputDecoration(
//                     labelText: 'Price',
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ElevatedButton(
//                   child: Text(action == 'create' ? 'Create' : 'Update'),
//                   onPressed: () async {
//                     final String? name = _nameController.text;
//                     final double? price =
//                         double.tryParse(_priceController.text);
//                     if (name != null && price != null) {
//                       if (action == 'create') {
//                         // Persist a new product to Firestore
//                         await _productss.add({"name": name, "price": price});
//                       }

//                       if (action == 'update') {
//                         // Update the product
//                         await _productss
//                             .doc(documentSnapshot!.id)
//                             .update({"name": name, "price": price});
//                       }

//                       // Clear the text fields
//                       _nameController.text = '';
//                       _priceController.text = '';

//                       // Hide the bottom sheet
//                       Navigator.of(context).pop();
//                     }
//                   },
//                 )
//               ],
//             ),
//           );
//         });
//   }

//   // Deleteing a product by id
//   Future<void> _deleteProduct(String productId) async {
//     await _productss.doc(productId).delete();

//     // Show a snackbar
//     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text('You have successfully deleted a product')));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Kindacode.com'),
//       ),
//       // Using StreamBuilder to display all products from Firestore in real-time
//       body: StreamBuilder(
//         stream: _productss.snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
//           if (streamSnapshot.hasData) {
//             return ListView.builder(
//               itemCount: streamSnapshot.data!.docs.length,
//               itemBuilder: (context, index) {
//                 final DocumentSnapshot documentSnapshot =
//                     streamSnapshot.data!.docs[index];
//                 return Card(
//                   margin: const EdgeInsets.all(10),
//                   child: ListTile(
//                     title: Text(documentSnapshot['name']),
//                     subtitle: Text(documentSnapshot['price'].toString()),
//                     trailing: SizedBox(
//                       width: 100,
//                       child: Row(
//                         children: [
//                           // Press this button to edit a single product
//                           IconButton(
//                               icon: const Icon(Icons.edit),
//                               onPressed: () =>
//                                   _createOrUpdate(documentSnapshot)),
//                           // This icon button is used to delete a single product
//                           IconButton(
//                               icon: const Icon(Icons.delete),
//                               onPressed: () =>
//                                   _deleteProduct(documentSnapshot.id)),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           }

//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//       // Add new product
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _createOrUpdate(),
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
