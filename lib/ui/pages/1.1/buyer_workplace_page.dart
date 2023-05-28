// import 'package:flutter/material.dart';

// class BuyerWorkplacePage extends StatelessWidget {
//   const BuyerWorkplacePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.grey[900],
//         title: const Text('РП Заказчика'),
//         elevation: 0,
//       ),
//       backgroundColor: Colors.grey[900],
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 height: 120,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/buyer_orders_list_page');
//                   },
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.orange[700],
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15)),
//                   ),
//                   child: const Text(
//                     'Ваши заявки',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 height: 120,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/create_order_page');
//                   },
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.orange[700],
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15)),
//                   ),
//                   child: const Text(
//                     'Разместить Заявку',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BuyerWorkplacePage extends StatelessWidget {
  const BuyerWorkplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text('РП Заказчика'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushReplacementNamed(context, '/home_page');
                });
              },
              icon: const Icon(Icons.logout_outlined)),
        ],
      ),
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 120,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/buyer_orders_list_page');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange[700],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Text(
                    'Мои заявки',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 120,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/create_order_page');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange[700],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Text(
                    'Разместить заявку',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
