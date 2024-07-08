// import 'package:flutter/material.dart';

// class ExpandbleWidget extends StatefulWidget {
//   @override
//   State<ExpandbleWidget> createState() => _ExpandbleWidgetState();
// }

// class _ExpandbleWidgetState extends State<ExpandbleWidget> {
//   bool isExpanded = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.red,
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: SingleChildScrollView(
//           child: ExpansionPanelList(
//             expansionCallback: (int index, bool isSelected) {
//               try {
//                 setState(() {
//                   listpanel[index].isSelcted = isSelected;
//                 });
//               } catch (e) {
//                 print(e.toString());
//               }
//               // if (index == 0) {
//               //   setState(() {
//               //     listpanel[index].isExpanded = isSelected;
//               //   });
//               // } else if (index == 1) {
//               //   setState(() {
//               //     listpanel[index].isExpanded = isSelected;
//               //   });
//               // }
//             },
//             children: listpanel.map((panel) {
//               return ExpansionPanel(
//                 headerBuilder: (context, bool isSelected) {
//                   return ListTile(
//                     title: Text(panel.panel!),
//                   );
//                 },
//                 body: ListTile(
//                   title: Text(panel.panel!),
//                   subtitle: Text("Panel title : ${panel.panel!}"),
//                 ),
//                 isExpanded: panel.isSelcted!,
//               );
//             }).toList(),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class UserDto{
//   String?
// }
