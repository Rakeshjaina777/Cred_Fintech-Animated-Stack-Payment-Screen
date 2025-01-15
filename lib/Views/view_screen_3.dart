



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_project/Model/fetchingdata.dart';
import 'package:provider/provider.dart';

class View3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSelected = false;
  final List<Color> customColors = [
    Colors.grey,
    Colors.purpleAccent,
    Colors.orange,
    Colors.indigo,
    Colors.amber,
    Colors.teal,
  ];

  @override



    Widget build(BuildContext context) {
      final apiData = Provider.of<ApiProvider>(context).data;

      if (apiData == null) {
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }

      final item = apiData.items[2];


      return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Container with text layers

        SizedBox(
          height: 180,
        ),
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(25),
            //color: Color.fromARGB(255, 34, 31, 31),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
    item.openState.body.title ?? 'No  title',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 156, 197, 230),
                ),
              ),
              SizedBox(height: 10),
              Text(
                item.openState.body.subtitle ?? 'No Subtitle',
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 156, 197, 230),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                //color: Colors.grey[200],
                child:  ListView.builder(
    shrinkWrap: true,  // Ensures ListView occupies only required space
    itemCount: item.openState.body.items?.length ?? 0,
    itemBuilder: (context, index) {
      return Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const Image(
              image: AssetImage(
                 'assets/hdfc.png', // Use a valid path or fallback
              ),
              width: 30,
              height: 50,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 10.0),
          GestureDetector(
            onTap: () {
              setState(() {
                isSelected = !isSelected;
              });
            },
            child: Stack(
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 2.0),
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.51,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                        isSelected ? Colors.blue : Colors.grey,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              item.openState.body.items?[index]?['title']
                                  ?.toString() ??

                                  'HDFC Bank',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              item.openState.body.items?[index]?['subtitle']
                                  ?.toString() ??
                                  'Account Number',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (isSelected)
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Icon(
                      Icons.check,
                      color: Colors.blue,
                    ),
                  ),
                if (!isSelected)
                  Positioned(
                    top: 15,
                    right: 15,
                    child: Icon(
                      Icons.account_balance_rounded,
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
          ),
        ],
      );
    }
                ),
              ),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  // Handle tap event
                  print('Container tapped!');
                },
                child: Container(
                  width: 200,
                  height: 30,
                  //padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    //color: Colors.blue,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
    item.openState.body.footer?? "Change Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTile() {
    return Container(
      width: 200,
      height: 50,
      child: Center(
        child: Text(
          'Rectangular Tile',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

















