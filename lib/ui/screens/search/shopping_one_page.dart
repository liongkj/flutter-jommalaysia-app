// import 'package:flutter/material.dart';

// import 'package:jommalaysia/core/models/category.dart';
// import 'package:jommalaysia/ui/shared/common_scaffold.dart';

// class CategoryGridScreen extends StatelessWidget {
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//   BuildContext _context;

//   //stack1
//   Widget imageStack(String img) => Image.network(
//         img,
//         fit: BoxFit.cover,
//       );

//   //stack2
//   Widget descStack(Category category) => Positioned(
//         bottom: 0.0,
//         left: 0.0,
//         right: 0.0,
//         child: Container(
//           decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Expanded(
//                   child: Text(
//                     category.categoryName,
//                     softWrap: true,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 Text("10",
//                     style: TextStyle(
//                         color: Colors.yellow,
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.bold))
//               ],
//             ),
//           ),
//         ),
//       );

//   //stack3

//   Widget categoryGrid(List<Category> categories) => GridView.count(
//         crossAxisCount:
//             MediaQuery.of(_context).orientation == Orientation.portrait ? 2 : 3,
//         shrinkWrap: true,
//         children: categories
//             .map((cat) => Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: InkWell(
//                     splashColor: Colors.yellow,
//                     onDoubleTap: () => {},
//                     child: Material(
//                       clipBehavior: Clip.antiAlias,
//                       elevation: 2.0,
//                       child: Stack(
//                         fit: StackFit.expand,
//                         children: <Widget>[
//                           imageStack(cat.image),
//                           descStack(cat),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ))
//             .toList(),
//       );

//   // Widget bodyData() {
//   //   ProductBloc productBloc = ProductBloc();
//   //   return StreamBuilder<List<Product>>(
//   //       stream: productBloc.productItems,
//   //       builder: (context, snapshot) {
//   //         return snapshot.hasData
//   //             ? productGrid(snapshot.data)
//   //             : Center(child: CircularProgressIndicator());
//   //       });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     _context = context;
//     return CommonScaffold(
//       scaffoldKey: scaffoldKey,
//       appTitle: "Products",
//       showDrawer: true,
//       showFAB: false,
//       actionFirstIcon: Icons.shopping_cart,
//       // bodyData: bodyData(),
//     );
//   }
// }