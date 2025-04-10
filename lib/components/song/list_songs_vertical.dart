import 'package:flutter/material.dart';
import 'package:music_app/components/song/item.dart';
import 'package:music_app/enums/song_item_layout.dart';
import 'package:music_app/themes/app_colors.dart';
import 'package:music_app/themes/app_text_themes.dart';

class ListSongsVertical extends StatelessWidget {
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
    {
      "title": "As long as you love me",
      "subtitle": "Backstreet Boy",
      "imagePath": "https://picsum.photos/200/300",
    },
    {
      "title": "My love",
      "subtitle": "Michael To Learn Rock",
      "imagePath": "https://picsum.photos/200/300",
    },
    {
      "title": "That why you go away",
      "subtitle": "Maroon 5",
      "imagePath": "https://picsum.photos/200/300",
    },
    {
      "title": "Die with your smile",
      "subtitle": "Ed Sheeran",
      "imagePath": "https://picsum.photos/200/300",
    },
    {
      "title": "Stronger",
      "subtitle": "Backstreet Boy",
      "imagePath": "https://picsum.photos/200/300",
    },
    {
      "title": "Impossible",
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
  final PageController _pageController = PageController();
  ListSongsVertical({super.key});

  @override
  Widget build(BuildContext context) {
    var itemPerPage = 4;

    var totalPage = (songs.length / itemPerPage).ceil();
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
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _pageController.previousPage(
                        duration: Durations.medium1,
                        curve: Curves.bounceInOut,
                      );
                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border(
                          bottom: BorderSide(width: 1, color: AppColors.border),
                          top: BorderSide(width: 1, color: AppColors.border),
                          right: BorderSide(width: 1, color: AppColors.border),
                          left: BorderSide(width: 2.5, color: AppColors.border),
                        ),
                      ),
                      child: Icon(Icons.chevron_left),
                    ),
                  ),
                  SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      _pageController.nextPage(
                        duration: Durations.medium1,
                        curve: Curves.bounceInOut,
                      );
                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border(
                          bottom: BorderSide(width: 1, color: AppColors.border),
                          top: BorderSide(width: 1, color: AppColors.border),
                          right: BorderSide(
                            width: 2.5,
                            color: AppColors.border,
                          ),
                          left: BorderSide(width: 1, color: AppColors.border),
                        ),
                      ),
                      child: Icon(Icons.chevron_right),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 400,
          child: PageView.builder(
            controller: _pageController,
            itemCount: totalPage,
            itemBuilder: (context, index) {
              final start = index * itemPerPage;
              final end = (start + itemPerPage).clamp(0, songs.length);
              final itemsInPage = songs.sublist(start, end);
              List<Widget> children =
                  itemsInPage.map((song) {
                    final isLast = song == itemsInPage.last;

                    return Padding(
                      padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
                      child: SongItem(
                        title: song['title'],
                        subtitle: song['subtitle'],
                        imagePath: song['imagePath'],
                        layout: SongItemLayout.horizontal,
                      ),
                    );
                  }).toList();

              return Column(children: children);
            },
          ),
        ),
      ],
    );
  }
}
