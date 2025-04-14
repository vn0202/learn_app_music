import 'package:flutter/material.dart';
import 'package:music_app/components/song/item.dart';
import 'package:music_app/enums/song_item_layout.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/routes/route_names.dart';
import 'package:music_app/services/song_services.dart';
import 'package:music_app/themes/app_colors.dart';
import 'package:music_app/themes/app_text_themes.dart';

class ListSongsVertical extends StatefulWidget {
  final String title;
  const ListSongsVertical({super.key, required this.title});

  @override
  State<ListSongsVertical> createState() => _ListSongsVerticalState();
}

class _ListSongsVerticalState extends State<ListSongsVertical> {
  final PageController _pageController = PageController();
  late Future<List<Song>> _futureSongs;
  @override
  void initState() {
    super.initState();
    _futureSongs = SongServices().fetchSongs();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureSongs,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No songs found.'));
        }
        List<Song>? songs = snapshot.data;
        var itemsPerPage = 4;
        var totalPage = (snapshot.data!.length / itemsPerPage).ceil();

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24),

              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
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
                              bottom: BorderSide(
                                width: 1,
                                color: AppColors.border,
                              ),
                              top: BorderSide(
                                width: 1,
                                color: AppColors.border,
                              ),
                              right: BorderSide(
                                width: 1,
                                color: AppColors.border,
                              ),
                              left: BorderSide(
                                width: 2.5,
                                color: AppColors.border,
                              ),
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
                              bottom: BorderSide(
                                width: 1,
                                color: AppColors.border,
                              ),
                              top: BorderSide(
                                width: 1,
                                color: AppColors.border,
                              ),
                              right: BorderSide(
                                width: 2.5,
                                color: AppColors.border,
                              ),
                              left: BorderSide(
                                width: 1,
                                color: AppColors.border,
                              ),
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
                  final start = index * itemsPerPage;
                  final end = (start + itemsPerPage).clamp(0, songs!.length);
                  final itemsInPage = songs.sublist(start, end);
                  List<Widget> children =
                      itemsInPage.map((song) {
                        final isLast = song == itemsInPage.last;

                        return Padding(
                          padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
                          child: SongItem(
                            song: song,
                            layout: SongItemLayout.horizontal,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteNames.songDetail,
                              );
                            },
                          ),
                        );
                      }).toList();

                  return Column(children: children);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
