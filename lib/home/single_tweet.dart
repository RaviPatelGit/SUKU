import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:suku/home/tweet_item_model.dart';
import 'package:suku/utils/time_ago.dart';

class SingleTweet extends StatelessWidget {
  final TweetItemModel tweet;
  const SingleTweet({super.key, required this.tweet});

  @override
  Widget build(BuildContext context) {
    return Column(
      // children: const [Text("data")],

      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            // children: const [Text("data")],

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(
                  Icons.account_circle,
                  color: Colors.grey,
                  size: 60.0,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // children: const [Text("data")],
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: tweet.username,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0)),
                            TextSpan(
                                text: " ${tweet.twitterHandle}",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                )),
                            TextSpan(
                                text: " ${timeAgo(tweet.time)}",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                )),
                          ]),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 4.0),
                          child: Icon(
                            Icons.expand_more,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        tweet.tweet,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(FontAwesomeIcons.comment, color: Colors.grey),
                          Icon(FontAwesomeIcons.retweet, color: Colors.grey),
                          Icon(FontAwesomeIcons.heart, color: Colors.grey),
                          Icon(FontAwesomeIcons.shareNodes, color: Colors.grey),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
    ;
  }
}
