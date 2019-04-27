import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Prepare data for dropdown------
  List ddData; //collect data for dropdown
  List<DropdownMenuItem<String>> dataToDD = []; //bring data to dropdown
  String ddDataSelected; //Keep data for dropdown select

  //-------------------------------
  TextEditingController ctrlName = TextEditingController();
  TextEditingController ctrlNumPerson = TextEditingController();
  bool cbSelected;
  int rdDiscount;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ddData = [
      'Changmai 940.00 Baht',
      'Tak 800.50 Baht',
      'Ranong 1200.75 Baht',
      'Rayoung 500.00 Baht',
      'Yala 100.00 Baht',
    ];
    for (int i = 0; i < ddData.length; i++){
      dataToDD.add(
        DropdownMenuItem(
          child: Text(
            ddData[i],
            style: TextStyle(
                color: Colors.blue
            ),
          ),
          value: ddData[i],
        ),
      );
    }
    ddDataSelected = ddData[0];
    cbSelected = false;
    rdDiscount = 0;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, //title stay at center
        title: Text(
          'Bangkok To Go!',
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 25.0,
                right: 25.0
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Image.asset(
                  'assets/images/bus.png',
                  height: 150.0,
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  controller: ctrlName,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                    labelText: 'Name',
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Bangkok To..',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.blue[700],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    items: dataToDD,
                    value: ddDataSelected,
                    isExpanded: true,
                    onChanged: (data){
                      setState(() {
                        ddDataSelected = data;
                      });
                    },
                  ),
                ),
                TextField(
                  controller: ctrlNumPerson,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.group,
                    ),
                    labelText: 'Count',
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
               Row(
                 children: <Widget>[
                   Checkbox(
                     value: cbSelected,
                     onChanged: (data){
                       setState(() {
                         cbSelected = data;
                       });
                     },
                   ),
                   Text(
                     'Goverment discount 50 Bath',
                   ),
                 ],
               ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: 0,
                      groupValue: rdDiscount,
                      onChanged: (data){
                        setState(() {
                          rdDiscount = 0;
                        });
                      },
                    ),
                    Text(
                      'dc 0%',
                    ),
                    Radio(
                      value: 5,
                      groupValue: rdDiscount,
                      onChanged: (data){
                        setState(() {
                          rdDiscount = data;
                        });
                      },
                    ),
                    Text(
                      'dc 5%',
                    ),
                    Radio(
                      value: 10,
                      groupValue: rdDiscount,
                      onChanged: (data){
                        setState(() {
                          rdDiscount = data;
                        });
                      },
                    ),
                    Text(
                      'dc 10%',
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        onPressed: (){
                          print(ctrlName.text);
                          print(ddDataSelected);
                          print(ctrlNumPerson.text);
                          print(cbSelected);
                          print(rdDiscount);
                        },
                        child: Text(
                          'CAL',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.blue[500],
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    Expanded(
                      child: RaisedButton(
                        onPressed: (){
                          setState(() {
                            ctrlName.text = '';
                            ddDataSelected = ddData[0];
                            ctrlNumPerson.text = '';
                            cbSelected = false;
                            rdDiscount = 0;
                          });
                        },
                        child: Text(
                          'CANCLE',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.red[900],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}