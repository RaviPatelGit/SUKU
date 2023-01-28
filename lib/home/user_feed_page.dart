import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:suku/home/single_tweet.dart';
import 'package:suku/home/tweet_helper.dart';
import 'package:suku/home/tweet_item_model.dart';

class UserFeedPage extends StatefulWidget {
  const UserFeedPage({super.key});

  @override
  State<UserFeedPage> createState() => _UserFeedPageState();
}

class _UserFeedPageState extends State<UserFeedPage> {
  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
          ),
        ),
        body: ListView.builder(
          // itemCount: TweetHelper.tweets.length,
          itemBuilder: ((context, position) {
            TweetItemModel tweet = TweetHelper.getTweet(position);

            return SingleTweet(tweet: tweet);
          }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue,
          child: const Icon(Icons.edit),
        ));
  }
}
