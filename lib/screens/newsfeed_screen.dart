import 'package:flutter/material.dart';
import '../widgets/newsfeed_card.dart';

class NewsfeedScreen extends StatelessWidget {
  const NewsfeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = [
      {
        'userName': 'Tony Stark',
        'postContent': 'I am Iron Man #GeniusBillionairePlayboyPhilantropist',
        'date': 'October 11',
        'numOfLikes': 3000,
        'hasPlaceholder': false,
        'hasImage': true,
        'postImage': 'assets/images/iron_man.jpg',
        'isNetworkImage': false,
      },
      
      {
        'userName': 'Captain America',
        'postContent': 'Language!',
        'date': 'December 2',
        'numOfLikes': 250,
        'hasPlaceholder': false,
        'hasImage': true,
        'postImage': 'assets/images/captain_america.png',
        'isNetworkImage': true,
      },
     
      {
        'userName': 'Hulk',
        'postContent': 'HULK SMASH!',
        'date': 'January 15',
        'numOfLikes': 45,
        'hasPlaceholder': true,
        'hasImage': false,
      },
      
      {
        'userName': 'Ant Man',
        'postContent': 'That\'s America\'s Ass',
        'date': 'February 14',
        'numOfLikes': 520,
        'hasPlaceholder': false,
        'hasImage': false,
      },

      {
        'userName': 'Spider-Man',
        'postContent': 'I\'M AN AVENGER!!!! #LoveYouMrStark',
        'date': 'May 15',
        'numOfLikes': 600,
        'hasPlaceholder': false,
        'hasImage': false,
      },

      {
        'userName': 'Black Widow',
        'postContent': 'I\'m always picking up after you boys...',
        'date': 'January 20',
        'numOfLikes': 10000,
        'hasPlaceholder': false,
        'hasImage': false,
      },

      {
        'userName': 'Loki',
        'postContent': 'I\'d never stab anyone in the back. That\'s such a boring form of betrayal.',
        'date': 'December 20',
        'numOfLikes': 500,
        'hasPlaceholder': false,
        'hasImage': false,
      },

      {
        'userName': 'Thanos',
        'postContent': 'I am Inevitable',
        'date': 'December 25',
        'numOfLikes': 0,
        'hasPlaceholder': false,
        'hasImage': false,
      },

      {
        'userName': 'Ned Leeds',
        'postContent': 'Spider-Man\'s guy on a chair! #HisNameIsNotPeterParker',
        'date': 'February 14',
        'numOfLikes': 600,
        'hasPlaceholder': false,
        'hasImage': false,
      },

      {
        'userName': 'Frank',
        'postContent': 'Mother F-',
        'date': 'June 19',
        'numOfLikes': 900,
        'hasPlaceholder': false,
        'hasImage': false,
      },
    ];

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return NewsfeedCard(
          userName: post['userName'] as String,
          postContent: post['postContent'] as String,
          date: post['date'] as String,
          numOfLikes: post['numOfLikes'] as int,
          hasPlaceholder: (post['hasPlaceholder'] ?? false) as bool,
          hasImage: (post['hasImage'] ?? false) as bool,
          postImage: post['postImage'] as String?,
          isNetworkImage: (post['isNetworkImage'] ?? false) as bool,
        );
      },
    );
  }
}