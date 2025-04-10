import 'package:flutter/material.dart';
import 'package:music_app/components/song/item.dart';
import 'package:music_app/enums/song_item_layout.dart';
import 'package:music_app/themes/app_colors.dart';
import 'package:music_app/themes/app_text_themes.dart';

class ListSongs extends StatefulWidget {
  const ListSongs({super.key});

  @override
  State<ListSongs> createState() => _ListSongsState();
}

class _ListSongsState extends State<ListSongs> {
  final List songs = [
    {
      "title": "As long as you love me",
      "subtitle": "Backstreet Boy",
      "imagePath": "https://picsum.photos/200/300",
    },
    {
      "title": "25 minutes",
      "subtitle": "Michael To Learn Rock",
      "imagePath": "https://picsum.photos/200/300",
    },
    {
      "title": "Sugar",
      "subtitle": "Maroon 5",
      "imagePath": "https://picsum.photos/200/300",
    },
    {
      "title": "Perfect",
      "subtitle": "Ed Sheeran",
      "imagePath": "https://picsum.photos/200/300",
    },
  ];

  var currentIndex = 0;
  void scrollNext() {
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (var song in songs) {
      children.add(
        SongItem(
          title: song['title'],
          subtitle: song['subtitle'],
          imagePath: song['imagePath'],
          layout: SongItemLayout.verticalLarger,
        ),
      );
      children.add(SizedBox(width: 16));
    }
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24),

          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Newest Songs",
                style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                  color: AppColors.primary,
                ),
              ),
              // Row(
              //   children: [
              //     GestureDetector(
              //       onTap: () {
              //         var offset = currentIndex * 284 * 0.8;
              //         _scrollController.animateTo(
              //           offset,
              //           duration: Duration(microseconds: 300),
              //           curve: Curves.easeOut,
              //         );
              //       },
              //       child: Container(
              //         width: 36,
              //         height: 36,
              //         decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           border: Border(
              //             bottom: BorderSide(width: 1, color: AppColors.border),
              //             top: BorderSide(width: 1, color: AppColors.border),
              //             right: BorderSide(width: 1, color: AppColors.border),
              //             left: BorderSide(width: 2.5, color: AppColors.border),
              //           ),
              //         ),
              //         child: Icon(Icons.chevron_left),
              //       ),
              //     ),
              //     SizedBox(width: 12),
              //     GestureDetector(
              //       onTap: () {
              //         scrollNext();
              //         var offset = currentIndex * 284 * 0.8 + 12;

              //         _scrollController.animateTo(
              //           offset,
              //           duration: Duration(microseconds: 300),
              //           curve: Curves.easeOut,
              //         );
              //       },
              //       child: Container(
              //         width: 36,
              //         height: 36,
              //         decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           border: Border(
              //             bottom: BorderSide(width: 1, color: AppColors.border),
              //             top: BorderSide(width: 1, color: AppColors.border),
              //             right: BorderSide(
              //               width: 2.5,
              //               color: AppColors.border,
              //             ),
              //             left: BorderSide(width: 1, color: AppColors.border),
              //           ),
              //         ),
              //         child: Icon(Icons.chevron_right),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
        SizedBox(height: 24),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: children),
        ),
      ],
    );
  }
}
