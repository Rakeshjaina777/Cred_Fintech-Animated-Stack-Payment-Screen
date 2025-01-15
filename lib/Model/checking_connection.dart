import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_project/Model/fetchingdata.dart';
import 'package:new_project/Model/modleforjsonformate.dart';
import 'package:provider/provider.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apiData = Provider.of<ApiProvider>(context).data;

    if (apiData == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Screen 1')),
      body: ListView.builder(
        itemCount: apiData.items.length,
        itemBuilder: (context, index) {
          final item = apiData.items[index];
          return ListTile(
            title: Text(item.openState.body.title ?? 'No Title'),
            subtitle: Text(item.openState.body.subtitle ?? 'No Subtitle'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Screen2(item: item),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


class Screen2 extends StatelessWidget {
  final Item item;

  Screen2({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen 2')),
      body: Column(
        children: [
          Text(item.openState.body.title ?? 'No Title'),
          Text(item.openState.body.subtitle ?? 'No Subtitle'),
          // Additional UI components
        ],
      ),
    );
  }
}
