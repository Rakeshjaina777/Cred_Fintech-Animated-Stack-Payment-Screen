
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_project/Model/fetchingdata.dart';

import 'package:provider/provider.dart';



class View1 extends StatelessWidget {
  const View1({super.key});

  @override
  Widget build(BuildContext context) {
    final apiData = Provider.of<ApiProvider>(context).data;

    if (apiData == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final item = apiData.items[0];


    return  Scaffold(



      backgroundColor: Colors.blue[900], // Navy blue color for the background
      body: Stack(
        children: [


          BackgroundWidget(),

          // Text(title),
          //
          // Text(
          //   'Title: ${title.isNotEmpty ? title : 'Loading...'}',
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontSize: 18,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),


          // Background widget
          Positioned(
            top: 49,
            left: 19,
            child: Container(
              padding: const EdgeInsets.all(9), // Add padding to the container
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(9), // Rounded corners
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Text(

              item.openState.body.title ?? 'No Subtitle',

                    // title.isNotEmpty ? title  : "Nikunj how much do you need?" ,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5), // Add spacing between heading and text
                  Text(
                    item.openState.body.subtitle ?? 'No Subtitle',

                    // subtitle.isNotEmpty ? subtitle  : "Move the dial and set any amount you need upto ₹50L" ,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: WidgetContainer(
              child: CreditWidget(
                creditAmount: 150000, // Initial credit amount
                interestRate: 1.04, // Initial interest rate
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
    );
  }
}

class WidgetContainer extends StatelessWidget {
  final Widget child;

  WidgetContainer({required this.child});

  @override
  Widget build(BuildContext context) {


    return Container(
      width: 400, // Increase the size of the container
      height: 400, // Increase the size of the container
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 3.0), // Black border
        borderRadius: BorderRadius.circular(20.0), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}

class CreditWidget extends StatefulWidget {
  final double creditAmount;
  final double interestRate;

  CreditWidget({required this.creditAmount, required this.interestRate});

  @override
  _CreditWidgetState createState() => _CreditWidgetState();
}

class _CreditWidgetState extends State<CreditWidget> {
  double _currentAmount = 150000; // Initial credit amount
  double _currentRate = 1.04; // Initial interest rate
  double _greenangle = pi;

  @override
  Widget build(BuildContext context) {
    final apiData = Provider.of<ApiProvider>(context).data;
    final item = apiData?.items[0];
    return Container(
      width: 200,
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(200, 200),
            painter: CreditPainter(
              creditAmount: _currentAmount,
              interestRate: _currentRate,
              greenArcAngle: _greenangle,
            ),
          ),
          Positioned(
            left: 190, // Adjust the positioning
            bottom: 0,
            child: Container(
              width: 20,
              height: 195,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,

              ),
              child: Icon(Icons.compass_calibration_rounded ,color: Colors.white,),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Credit Amount',
                style: TextStyle(fontSize: 12),
              ),
              Text(
                '\₹${_currentAmount.toStringAsFixed(0)}',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                '@ ${_currentRate.toStringAsFixed(2)}% monthly',
                style: TextStyle(fontSize: 10, color: Colors.green),
              ),
            ],
          ),


          CaptionContainer(
            caption:     item?.openState.body.footer ?? 'No Subtitle',
            margin: EdgeInsets.only(left: 20.0, top: 20.0),
            alignment: Alignment.bottomCenter,
          ),
        ],
      ),
    );
  }
}




class CreditPainter extends CustomPainter {
  final double creditAmount;
  final double interestRate;
  final double greenArcAngle; // Angle for the green portion

  CreditPainter({
    required this.creditAmount,
    required this.interestRate,
    required this.greenArcAngle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.transparent
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double radius = size.width / 2;
    double angle = (creditAmount / 10000) * (2 * pi);

    canvas.drawArc(
      Rect.fromCircle(center: Offset(radius, radius), radius: radius),
      -pi / 4,
      angle,
      false,
      paint,
    );

    Paint borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawCircle(
      Offset(radius, radius),
      radius - 2.5, // Adjust the radius for the border
      borderPaint,
    );

    // Draw the green arc
    Paint greenPaint = Paint()
      ..color = Colors.deepOrange.shade300
      ..strokeWidth = 7.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(radius, radius), radius: radius),
      -pi / 2,
      greenArcAngle,
      false,
      greenPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
class CaptionContainer extends StatelessWidget {
  final String caption;
  final EdgeInsets margin;
  final Alignment alignment;

  const CaptionContainer({
    Key? key,
    required this.caption,
    this.margin = const EdgeInsets.all(8.0),
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: margin,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          caption,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}




