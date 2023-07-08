import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EventListPage extends StatefulWidget {
  @override
  _EventListPageState createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  List<int> venueIds = [60267807]; // Add more venue IDs if needed
  List<Event> events = [];
  String nextPageUrl = '';
  int venueIndex = 0;

  Future<void> fetchEvents() async {
    final apiKey = 'M4IXPOJODGO4AAUVZIN3';
    final baseUrl = 'https://www.eventbriteapi.com/v3/';
    final endpoint = 'venues/${venueIds[venueIndex]}/events/';
    final limit = 20; // Set the desired limit of events

    try {
      while (nextPageUrl != null && events.length < limit) {
        final url = nextPageUrl.isNotEmpty ? nextPageUrl : baseUrl + endpoint;

        final response = await http.get(
          Uri.parse(url),
          headers: {'Authorization': 'Bearer $apiKey'},
        );

        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);

          if (responseData.containsKey('events')) {
            final fetchedEvents = Event.fromJsonList(responseData['events']);

            // Filter out duplicate events
            final uniqueEvents = fetchedEvents.where((event) => !events
                .any((existingEvent) => existingEvent.name == event.name));

            setState(() {
              events.addAll(uniqueEvents.take(limit - events.length));
            });
          } else {
            print('Error: Events not found in API response.');
          }

          nextPageUrl = responseData['pagination']['next'] ?? '';

          if (nextPageUrl == null && venueIndex < venueIds.length - 1) {
            venueIndex++;
            nextPageUrl = baseUrl + 'venues/${venueIds[venueIndex]}/events/';
          }
        } else {
          print('Error: ${response.statusCode}');
          break;
        }
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event List'),
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return Stack(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(event.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              ListTile(
                title: Text(
                  event.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  event.startDate,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                onTap: () {
                  // Add any action you want when an event is tapped
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class Event {
  final String name;
  final String startDate;
  final String imageUrl;

  Event({required this.name, required this.startDate, required this.imageUrl});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      name: json['name']['text'],
      startDate: json['start']['local'],
      imageUrl: json['logo'] != null ? json['logo']['original']['url'] : '',
    );
  }

  static List<Event> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Event.fromJson(json)).toList();
  }
}
