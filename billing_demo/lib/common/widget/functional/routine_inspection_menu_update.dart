// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../../../features/routine_inspection/domain/routine_inspection_menu_model.dart';
// import '../../../service/application/model/singleton/routine_inspection_menu_model.dart';
// import '../classes/task_container.dart';
// import '../task_container.dart';

// Widget routineInspectionMenuUpdated({
//   required List<RoutineInspectionMenuModel> menu,
//   required Function(RoutineInspectionMenuModel) onItemSelected,
// }) {
//   return SingleChildScrollView(
//     child: Column(
//       children: <Widget>[
//         Center(
//           child: ListView.builder(
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               return Container(
//                 margin: const EdgeInsets.fromLTRB(20, 23, 20, 0),
//                 //const EdgeInsets.all(8),
//                 child: TaskContainer(
//                   //width: double.infinity,
//                   height: 170,
//                   widget: _routineInspectionItem(
//                     menu[index],
//                     onItemSelected,
//                   ),
//                 ),
//               );
//             },
//             itemCount: menu.length,
//           ),
//         )
//       ],
//     ),
//   );
// }

// Widget _routineInspectionItem(
//   RoutineInspectionMenuModel item,
//   Function(RoutineInspectionMenuModel) onItemSelected,
// ) {
//   return InkWell(
//     onTap: () => onItemSelected(item),
//     child: Padding(padding: const EdgeInsets.symmetric(vertical: 8.0), 
//       child: Row(children: [
//         const Placeholder(fallbackWidth: 150),
//         //SvgPicture.asset('assets/images/Quarters.png'),
//         const SizedBox(width: 16),
//         Expanded(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.start, 
//             children: [
//               const Expanded(
//                 child: Text("Teres", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue))
//               ),
//               Expanded(
//                 child: Text("Pemantauan ${item.id}", style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
//               ),
//               Expanded(
//                 child: Row(children: [
//                     Expanded(
//                       child: Column(children: [
//                         Row(children: [
//                           SvgPicture.asset('assets/images/Person.svg', width: 14),
//                           //const Icon(Icons.person, size: 20, color: Colors.grey),
//                           const SizedBox(width: 10),
//                           Expanded(
//                             child: Text(item.name, 
//                               style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold), 
//                               overflow: TextOverflow.ellipsis, maxLines: 2, softWrap: false)),
//                         ]),
//                       ]),
//                     ),
//                     Expanded(
//                       child: Column(children: [
//                         Row(crossAxisAlignment: CrossAxisAlignment.start, 
//                           children: [
//                             //const Icon(Icons.location_on, size: 20, color: Colors.grey),
//                             SvgPicture.asset('assets/images/Location.svg', width: 16),
//                             //ImageIcon(AssetImage("assets/images/Location.svg"), size: 24,),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: Text(item.address, 
//                                 style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold), 
//                                 overflow: TextOverflow.ellipsis, maxLines: 2, softWrap: false)),
//                         ]),
//                       ]),
//                     )
//                 ])
//               ),
//               Expanded(
//                 child: Row(children: [
//                   Expanded(
//                     child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//                       Row(children: [
//                         SvgPicture.asset("assets/images/Phone.svg", width: 16),
//                         //const Icon(Icons.phone, size: 20, color: Colors.grey),
//                         const SizedBox(width: 10),
//                         Text(item.phoneNum, 
//                           style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold)),
//                       ]),
//                     ]),
//                   ),
//                   Expanded(
//                     child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//                       Row(children: [
//                         SvgPicture.asset("assets/images/Email.svg", width: 16),
//                         //const Icon(Icons.email, size: 20, color: Colors.grey),
//                         const SizedBox(width: 10),
//                         Text(item.email, 
//                           style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold)),
//                       ]),
//                     ]),
//                   )
//                 ])
//               ),
//           ]),
//         ),
//       ])
//     ),
//   );
// }
