import 'package:flutter/material.dart';

class ShowPage extends StatefulWidget {
  // get from home_page
  String name;
  String goto;
  String count;
  bool govt;
  int discount;

  ShowPage(this.name, this.goto, this.count, this.govt, this.discount);

  @override
  _ShowPageState createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  double pay;
  @override
  void initState() {
    super.initState();
    double govtPay;
    if (widget.govt == true) {
      govtPay = 50.0;
    } else {
      govtPay = 0.0;
    }

    double gotoPay;
    if (widget.goto == 'Changmai 940.00 Baht') {
      gotoPay = 940.0;
    }else if (widget.goto == 'Tak 800.50 Baht') {
      gotoPay = 800.50;
    }else if (widget.goto == 'Ranong 1200.75 Baht') {
      gotoPay = 1200.75;
    }else if (widget.goto == 'Rayoung 500.00 Baht') {
      gotoPay = 500.0;
    }else {
      gotoPay = 100.0;
    }

    double discountPay = (gotoPay * int.parse(widget.count) * widget.discount /100);
    pay = (gotoPay * int.parse(widget.count) - discountPay - govtPay);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Show Bangkok To Go',
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/bus.png',
                height: 150.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Name : ${widget.name}',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[500],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Go To : ${widget.goto}',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[500],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Count : ${widget.count}',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[500],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Pay : ${pay} Bath',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[500],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
