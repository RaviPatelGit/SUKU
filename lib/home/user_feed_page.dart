import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nostr/nostr.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:suku/home/single_tweet.dart';
import 'package:suku/home/tweet_helper.dart';
import 'package:suku/home/tweet_item_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class UserFeedPage extends StatefulWidget {
  const UserFeedPage({super.key});

  @override
  State<UserFeedPage> createState() => _UserFeedPageState();
}

class _UserFeedPageState extends State<UserFeedPage> {
  final List<Event> events = [];
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://nostr.sandwich.farm'),
    // Uri.parse('wss://echo.websocket.events'),
  );
  @override
  Widget build(BuildContext context) {
    Request requestWithFilter = Request(generate64RandomHexChars(), [
      Filter(
        kinds: [0, 1, 2, 7],
        // since: 1674940000,
        since: 1674920000,
        // limit: 450,
      )
    ]);
    _channel.sink.add(requestWithFilter.serialize());

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Home', style: TextStyle(color: Colors.black)),
          leading: IconButton(
            icon: const Icon(
              Icons.account_circle,
              color: Colors.grey,
              size: 35.0,
            ),
            onPressed: () {
              // display to profile_page
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height: 24),
              StreamBuilder(
                stream: _channel.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  if (!snapshot.hasData) {
                    return const Text('Waiting for data...');
                  }
                  var data = jsonDecode(snapshot.data);
                  if (data[0] == "EVENT") {
                    events
                        .add(Event.fromJson(data[2], subscriptionId: data[1]));
                    //   // events.sort((a, b) => b.createdAt.compareTo(a.createdAt));
                    //   //                 String log = '''
                    //   // id     : ${data[2]['id']}
                    //   // kind   : ${data[2]['kind']}
                    //   // content: ${data[2]['content']}
                    //   // loaded : ${events.length}
                    //   //  ''';
                    //   //                 logger.d(log);
                  }
                  return Expanded(
                    child: ListView.builder(
                      reverse: true,
                      itemCount: events.length,
                      // reverse: true,
                      itemBuilder: (context, index) {
                        final tweet = TweetItemModel(
                          events[index].content,
                          events[index].pubkey.substring(0, 8),
                          events[index].createdAt,
                          '@xyz',
                        );
                        return SingleTweet(tweet: tweet);
                        // return Text(snapshot.hasData
                        //     ? '--------------------\n${events[index].kind}\n${events[index].createdAt}\n${events[index].content}'
                        //     : 'xxxx');
                      },
                    ),
                  );
                  // return Text(
                  //     snapshot.hasData ? '${events.last.content}' : 'xxxx');
                },
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue,
          child: const Icon(Icons.edit),
        ));
  }
}
