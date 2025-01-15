

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_project/Model/fetchingdata.dart';
import 'package:provider/provider.dart';

class View2 extends StatelessWidget {
  final String creditAmount;

  View2({required this.creditAmount});

  @override
  Widget build(BuildContext context) {
    return MyHomePage(creditAmount: creditAmount);
  }
}




class MyHomePage extends StatefulWidget {
  final String creditAmount;

  MyHomePage({required this.creditAmount});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> isSelected = List.generate(6, (index) => false);
  int selectedIndex = -1;
  final List<Color> customColors = [
    Colors.tealAccent,
    Colors.lightBlue.shade200,
    Colors.indigo.shade200,
    Colors.indigo.shade300,
    Colors.amber,
    Colors.teal,
  ];


  // List<dynamic> plans = [];
  // bool isLoading = true;



  @override

  Widget build(BuildContext context) {
    final apiData = Provider.of<ApiProvider>(context).data;

    if (apiData == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final item = apiData.items[1].openState.body;


    return

        Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          // Container with text layers
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent, // Background color
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        // color: Colors.grey, // Shadow color
                        spreadRadius: 2, // Spread of the shadow
                        blurRadius: 4, // Blur radius for soft shadow
                        offset: Offset(0, 3), // Shadow position (x, y)
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Credit Amount: ${widget.creditAmount}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Text(
                  item.title ?? 'No Subtitle',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 156, 197, 230),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  item.subtitle ?? 'No Subtitle',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 156, 197, 230),
                  ),
                ),
              ],
            ),
          ),
          // Container with selectable squares
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            height: 200, // Adjust height as needed
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                item.items != null ? item.items!.length : 0, // Ensure item is not null
                    (index) => _buildSquare(index), // Use the index to generate each widget
              )

            ),
          ),
          // Container with customizable button
          GestureDetector(
            onTap: () {
              print('Minor_screen.dart tapped');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 103, 124, 142)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                  item.footer ?? 'No Subtitle',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 156, 197, 230),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSquare(int index) {
    final apiData = Provider.of<ApiProvider>(context).data;
    final item = apiData?.items[1].openState.body.items;
    int temp = index + 1;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index == selectedIndex ? -1 : index;
        });
      },
      child: Container(
        width: 200,
        height: 200,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[600]!),
          borderRadius: BorderRadius.circular(5),
          color: customColors[index],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              selectedIndex == index
                  ? Icon(Icons.check_circle, color: Colors.blue)
                  : Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color.fromARGB(255, 31, 22, 22),
                  ),
                  color: Color.fromARGB(255, 195, 190, 190),
                ),
                height: 25,
                width: 25,
              ),
              SizedBox(height: 38),
              Text(
                (item != null && index < item.length && item[index].isNotEmpty)
                    ? item[index]['emi'].toString()
                    : 'No Data',

                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),

              Text(
                (item != null && index < item.length && item[index].isNotEmpty)
                    ? item[index]['duration'].toString()
                    : 'No Data',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Text(
                (item != null && index < item.length && item[index].isNotEmpty)
                    ? item[index]['subtitle'].toString()
                    : 'No Data',
                // textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


