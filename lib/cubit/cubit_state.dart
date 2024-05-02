part of 'cubit_tab.dart';

@immutable
sealed class CubitState {}

final class CubitInitial extends CubitState {}
//  const Text(
//                 'Games',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 18,
//                   color: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 width: double.infinity,
//                 height: 181,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   color: const Color(0xFF363344),
//                 ),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(width: 20),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
//                       child: SizedBox(
//                         width: 30.0,
//                         height: 30.0,
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(50.0),
//                           ),
//                           child: const Center(
//                             child: Text(
//                               '1',
//                               textAlign: TextAlign.justify,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     const SizedBox(
//                       width: 271,
//                       height: 149,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Spacer(),
//                           Text(
//                             'Game name',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.white,
//                             ),
//                           ),
//                           Text(
//                             'Poker',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.white,
//                             ),
//                           ),
//                           Spacer(),
//                           Text(
//                             'Investmen amaunt',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.white,
//                             ),
//                           ),
//                           Text(
//                             '\$1000',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.white,
//                             ),
//                           ),
//                           Spacer(),
//                           Row(
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Won',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   Text(
//                                     '\$2000',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(width: 30),
//                               Column(
//                                 children: [
//                                   Text(
//                                     'Playtime',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   Text(
//                                     '2h 30m',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
//                       child: GestureDetector(
//                         onTap: () {},
//                         child: const Icon(
//                           Icons.more_vert,
//                           color: Colors.white,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),