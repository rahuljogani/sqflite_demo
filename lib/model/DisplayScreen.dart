// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sqflite_app/service/DatabaseHandler.dart';
//
// class DisplayScreen extends StatefulWidget
// {
//   @override
//   DisplayScreenState createState() => DisplayScreenState();
// }
//
// class DisplayScreenState extends State<DisplayScreen>
// {
//
//   Future<List>? userdata;
//   DatabaseHandler obj = new DatabaseHandler();
//
//   getalldisplayrecords() async{
//     setState(() {
//       userdata = obj.display_records();
//     });
//   }
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getalldisplayrecords();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text("Display Screen"),
//         ),
//       ),
//       body: FutureBuilder<List>(
//         future: userdata,
//         builder: (context,snapshot){
//           if(snapshot.hasData)
//           {
//             if (snapshot.data!.length<=0)
//             {
//               return Center
//                 (
//                 child: Text("No Data Found"),
//               );
//             }
//             else
//             {
//               return ListView.builder(
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (context,position)
//                   {
//                     return SingleChildScrollView
//                       (
//                       child: InkWell(
//                         onTap: () async {
//                           AlertDialog alert = new AlertDialog(
//                             title: Text("Warning"),
//                             content: Text("Are You Want To Sure?"),
//                             actions: [
//                               RaisedButton(
//                                 onPressed: () async
//                                 {
//                                   Navigator.of(context).pushNamed("UpdateScreen",arguments: {"id":snapshot.data[position].row[0].toString()});
//                                 },
//                                 color: Colors.teal,
//                                 textColor: Colors.white,
//                                 child: Text("UPDATE"),
//                               ),
//                               RaisedButton(
//                                 onPressed: () async
//                                 {
//                                   int result = await obj.delete_record(snapshot.data[position].row[0].toString());
//                                   Navigator.of(context).pop();
//                                   getalldisplayrecords();
//                                 },
//                                 color: Colors.teal,
//                                 textColor: Colors.white,
//                                 child: Text("DELETE"),
//                               ),
//                             ],
//                           );
//                           showDialog(context: context, builder: (BuildContext context){
//                             return alert;
//                           });
//                         },
//                         child: Container(
//                           padding: EdgeInsets.all(15.0),
//                           decoration: BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                 color: Colors.teal.shade800,
//                               ),
//                             ),
//                           ),
//                           child: ListTile(
//                             leading: CircleAvatar(
//                               radius: 22.0,
//                               backgroundColor: Colors.orange,
//                               child: Text(snapshot.data[position].row[1].toString().toUpperCase()[0],style: TextStyle(color: Colors.black),),
//                             ),
//                             title: Text("Name :"+snapshot.data[position].row[1].toString(),style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w400),),
//                             subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("Contact :"+snapshot.data[position].row[2].toString(),style: TextStyle(color: Colors.blueGrey)),
//                                 Text("Email :"+snapshot.data[position].row[3].toString(),style: TextStyle(color: Colors.blueGrey),),
//                                 Text("Password :"+snapshot.data[position].row[4].toString(),style: TextStyle(color: Colors.blueGrey),),
//                                 Text("Gender :"+snapshot.data[position].row[5].toString(),style: TextStyle(color: Colors.blueGrey),),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   });
//             }
//           }
//         },
//       ),
//     );
//   }
// }