import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_app/model/update/update_screen.dart';
import 'package:sqflite_app/model/user_registration.dart';
import 'package:sqflite_app/service/DatabaseHandler.dart';

class userInformation extends StatefulWidget
{
  @override
  userInformationState createState() =>  userInformationState();
}

class  userInformationState extends State<userInformation>
{

  // List userdata = [];

   Future<List> userdata;

  DatabaseHandler obj = new DatabaseHandler();

   getalldisplayrecords() async{
     setState(() {
       userdata = obj.display_records();
     });
   }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getalldisplayrecords();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        title: Center(
          child: Text("User Information"),
        ),
      ),
      body: FutureBuilder<List>(
        future: userdata,
        builder: (context, snapshot)
        {
          if(snapshot.hasData)
            {
              if(snapshot.data.length<=0)
                {
                  return Center(
                    child: Text("No Data Found"),
                  );
                }
              else
                {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context,position)
                    {
                      return SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.teal.shade800,
                              ),
                            ),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 22.0,
                              backgroundColor: Colors.blueGrey,
                              child: Text(snapshot.data[position].row[1].toString().toUpperCase()[0],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                            ),
                            title: Text("Name :"+snapshot.data[position].row[1].toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Contact :"+snapshot.data[position].row[2].toString(),style: TextStyle(color: Colors.black)),
                                Text("Email :"+snapshot.data[position].row[3].toString(),style: TextStyle(color: Colors.black)),
                                // Text("Password :"+snapshot.data![position].row[4].toString(),style: TextStyle(color: Colors.blueGrey)),
                                Text("Gender :"+snapshot.data[position].row[6].toString(),style: TextStyle(color: Colors.black)),
                              ],
                            ),
                            trailing: Column(
                              children: [
                                Container(
                                  child:InkWell(
                                    child: Icon(Icons.edit,color: Colors.teal),
                                    onTap: () async{
                                       // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>UpdateScreen()));
                                     Navigator.of(context).pushNamed("UpdateScreen",arguments: {"id":snapshot.data[position].row[0].toString()});
                                    },
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  child:InkWell(
                                    child: Icon(Icons.delete,color: Colors.redAccent),
                                    focusColor: Colors.brown,
                                    onTap: () async{
                                      int result = await obj.delete_records(snapshot.data[position].row[0].toString());
                                      // Navigator.of(context).pop();
                                      getalldisplayrecords();
                                    },
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
            }
             return Center(
             child: CircularProgressIndicator(),
           );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>UserRegistration()));
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}