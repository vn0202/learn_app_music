import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/services/song_services.dart';
import 'package:music_app/themes/app_colors.dart';
import 'package:music_app/themes/app_text_themes.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final LayerLink _layerLink = LayerLink();
  final TextEditingController _controller = TextEditingController();
  bool isLoading = false;
  OverlayEntry? _overlayEntry;
  List<Song> suggestions = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _removeOverlay();
    _controller.dispose();
    super.dispose();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _onSearchChanged(String value) async {
    if (value.isNotEmpty) {
      isLoading = true;
      if (_overlayEntry != null) {
        _overlayEntry?.markNeedsBuild();
      } else {
        _showOverlay();
      }
      final results = await SongServices().suggestionSong(value);
      isLoading = false;
      suggestions = results;
      if (_overlayEntry != null) {
        _overlayEntry?.markNeedsBuild();
      } else {
        _showOverlay();
      }
    } else if (value.isEmpty) {
      _removeOverlay();
    }
  }

  void _showOverlay() {
    final renderBox = context.findRenderObject() as RenderBox?;
    final overlay = Overlay.of(context);
    final size = renderBox?.size ?? Size.zero;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        Widget childOverlay =
            isLoading
                ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicator()),
                )
                : (suggestions.isNotEmpty
                    ? ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: suggestions.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(
                            Icons.music_note,
                            color: Colors.purple,
                          ),
                          title: Text(suggestions[index].name),
                          onTap: () {
                            _removeOverlay();
                            suggestions[index].navigatorToSongDetailPage(
                              context,
                            );
                          },
                        );
                      },
                    )
                    : _buildHintUseAddSong());
        return Positioned(
          width: size.width - 48,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: const Offset(0, 62),
            child: Material(
              borderRadius: BorderRadius.circular(6),
              elevation: 4,
              child: childOverlay,
            ),
          ),
        );
      },
    );
    overlay.insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchSection(),
              Divider(),
              SizedBox(height: 24),
              Align(
                alignment: Alignment.center,
                child: Column(
                  spacing: 12,
                  children: [
                    Text(
                      "Hãy chọn 1 chủ đề ",
                      style: AppTextTheme.lightTextTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Hoặc tìm kiếm bằng từ khóa",
                      style: AppTextTheme.lightTextTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _buildHintItem(
                      Icon(Icons.favorite, color: AppColors.primary),
                      "Top yeu thich",
                      () {},
                    ),
                    _buildHintItem(
                      Icon(Icons.grid_view_rounded, color: AppColors.primary),
                      "Moi nhat",
                      () {},
                    ),
                    _buildHintItem(
                      Icon(Icons.visibility, color: AppColors.primary),
                      "Xem nhieu nhat",
                      () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchSection() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      child: CompositedTransformTarget(
        link: _layerLink,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                controller: _controller,

                onChanged: _onSearchChanged,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),

                  hintText: "Enter your song",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),

            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close, size: 32),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHintItem(Icon icon, String name, VoidCallback onTap) {
    final color = AppColors.border;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border(
            top: BorderSide(width: 1, color: color),
            left: BorderSide(width: 1, color: color),
            right: BorderSide(width: 2.5, color: color),
            bottom: BorderSide(width: 2.5, color: color),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 12,
          children: [icon, Text(name), Icon(Icons.chevron_right)],
        ),
      ),
    );
  }

  Widget _buildHintUseAddSong() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      child: Column(
        spacing: 12,
        children: [
          Text(
            "Can ‘t find your  song?",
            style: AppTextTheme.lightTextTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            "Don’t worry!  Let's try our feature",
            style: AppTextTheme.lightTextTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Request your song")),
        ],
      ),
    );
  }
}
