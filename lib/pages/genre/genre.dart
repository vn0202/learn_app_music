import 'package:flutter/material.dart';
import 'package:music_app/components/song/item.dart';
import 'package:music_app/enums/song_item_layout.dart';
import 'package:music_app/models/genre.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/services/genre_services.dart';
import 'package:music_app/themes/app_colors.dart';
import 'package:music_app/themes/app_text_themes.dart';
import 'package:music_app/widgets/inc/appbar.dart';
import 'package:music_app/widgets/inc/footer.dart';

class GenrePage extends StatefulWidget {
  final Genre genre;
  final numberItemsShow = 10;
  const GenrePage({super.key, required this.genre});

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  late ScrollController _controller;
  bool _hasMore = false;
  final List<Song> _items = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_loadMore);
    _loadData();
  }

  Future<void> _loadMore() async {
    if (_controller.position.pixels == _controller.position.maxScrollExtent &&
        _hasMore) {
      _loadData();
    }
  }

  Future<void> _loadData() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });
    final items = await GenreServices().getListSong(
      genreId: 1,
      offset: _items.length,
      limit: _items.length + widget.numberItemsShow,
    );
    setState(() {
      _items.addAll(items);
      _isLoading = false;
      _hasMore = items.length == widget.numberItemsShow;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(title: "Genre"),
      bottomNavigationBar: Footer(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.genre.name,
              style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                color: AppColors.primary,
                fontSize: 34,
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                controller: _controller,
                shrinkWrap: true,
                itemCount: _items.length + 1,
                itemBuilder: (context, index) {
                  if (index == _items.length) {
                    return _isLoading
                        ? Center(child: CircularProgressIndicator())
                        : SizedBox();
                  }
                  return SizedBox(
                    width: 100,
                    child: SongItem(
                      song: _items[index],
                      layout: SongItemLayout.verticalLarger,
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
