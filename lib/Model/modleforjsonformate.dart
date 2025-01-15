import 'dart:convert';

class ApiResponse {
  final List<Item> items;

  ApiResponse({required this.items});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      items: (json['items'] as List).map((i) => Item.fromJson(i)).toList(),
    );
  }
}

class Item {
  final OpenState openState;
  final ClosedState closedState;
  final String ctaText;

  Item({required this.openState, required this.closedState, required this.ctaText});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      openState: OpenState.fromJson(json['open_state']),
      closedState: ClosedState.fromJson(json['closed_state']),
      ctaText: json['cta_text'],
    );
  }
}

class OpenState {
  final Body body;

  OpenState({required this.body});

  factory OpenState.fromJson(Map<String, dynamic> json) {
    return OpenState(body: Body.fromJson(json['body']));
  }
}

class ClosedState {
  final Map<String, dynamic> body;

  ClosedState({required this.body});

  factory ClosedState.fromJson(Map<String, dynamic> json) {
    return ClosedState(body: json['body']);
  }
}

class Body {
  final String? title;
  final String? subtitle;
  final List<dynamic>? items;
  final Card? card;
  final String? footer;

  Body({this.title, this.subtitle, this.items, this.card, this.footer});

  factory Body.fromJson(Map<String, dynamic> json) {
    return Body(
      title: json['title'],
      subtitle: json['subtitle'],
      items: json['items'],
      card: json['card'] != null ? Card.fromJson(json['card']) : null,
      footer: json['footer'],
    );
  }
}

class Card {
  final String header;
  final String description;
  final int maxRange;
  final int minRange;

  Card({
    required this.header,
    required this.description,
    required this.maxRange,
    required this.minRange,
  });

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      header: json['header'],
      description: json['description'],
      maxRange: json['max_range'],
      minRange: json['min_range'],
    );
  }
}
