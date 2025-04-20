import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/routes/route_names.dart';
import 'package:music_app/services/song_services.dart';
import 'package:music_app/themes/app_colors.dart';
import 'package:music_app/themes/app_text_themes.dart';
import 'package:music_app/widgets/inc/appbar.dart';
import 'package:music_app/widgets/inc/footer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AddSongPage extends StatefulWidget {
  const AddSongPage({super.key});

  @override
  State<AddSongPage> createState() => _AddSongPageState();
}

class _AddSongPageState extends State<AddSongPage> {
  Song? availableSong;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _controller;
  bool isNextRequest = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  Future<Song?> getSong(String id) async {
    setState(() {
      isLoading = true;
    });

    final song = await SongServices().getSong(1);
    setState(() {
      isLoading = false;
    });
    return song;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(title: "Add Song"),
      bottomNavigationBar: Footer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/banner/amico.png",
                height: 250,
                width: double.infinity,
              ),
              SizedBox(height: 24),

              Text(
                "How to create a request ? ",
                style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.only(left: 12),
                child: DefaultTextStyle(
                  style: AppTextTheme.lightTextTheme.titleMedium!,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6,
                    children: [
                      Text("1.Find your song on Youtube"),
                      Text("2.Copy  the link"),

                      Text("3.Paste it into the request form and submit!"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              _buildFormRequest(context),
            ],
          ),
        ),
      ),
    );
  }

  void reset() {
    _controller.clear();
    setState(() {
      availableSong = null;
    });
  }

  Widget _buildFormRequest(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Link is required';
              }

              final youtubeRegex = RegExp(
                r'^(https?\:\/\/)?(www\.youtube\.com|youtu\.be)\/.+$',
              );

              if (!youtubeRegex.hasMatch(value)) {
                return 'Please enter a valid YouTube link';
              }

              return null; // ✅ Hợp lệ
            },
            decoration: InputDecoration(
              hintText: "Paste your link video ",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 1),
              ),
            ),
          ),
          SizedBox(height: 24),
          isLoading
              ? CircularProgressIndicator()
              : (availableSong != null ? _buildAvailableSong() : Container()),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                final ctx = context;
                if (isNextRequest) {
                  setState(() {
                    availableSong = null;
                  });
                }
                bool valid = _formKey.currentState!.validate();
                if (valid) {
                  if (!isNextRequest) {
                    isNextRequest = true;
                  }
                  final youtubeId = YoutubePlayer.convertUrlToId(
                    _controller.text.trim(),
                  );
                  Song? songTmp = await getSong(youtubeId ?? "");
                  if (!ctx.mounted) {
                    return;
                  } // ⬅️ Check this before using context

                  setState(() {
                    availableSong = songTmp;
                  });

                  if (songTmp == null) {
                    showSuccessDialog(ctx);
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text("Request"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvailableSong() {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        child: Column(
          children: [
            Text(
              "Bài hát bạn yêu cầu đã có trên hệ thống của chúng tôi!",
              style: AppTextTheme.lightTextTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),

            GestureDetector(
              onTap: () => availableSong?.navigatorToSongDetailPage(context),
              child: Row(
                spacing: 12,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      "https://picsum.photos/200/300",
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 12,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          availableSong?.name ?? "",
                          style: AppTextTheme.lightTextTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          availableSong?.singer ?? "",
                          style: AppTextTheme.lightTextTheme.titleSmall!
                              .copyWith(color: AppColors.textSecondary),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            actionsPadding: EdgeInsets.only(bottom: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            title: Center(
              child: Column(
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 48),
                  SizedBox(height: 8),
                  Text("Success"),
                ],
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Text(
                  'Yêu cầu của bạn đã được tiếp nhận! Chúng tôi đang xử lý bài hát của bạn và sẽ thông báo ngay khi có sẵn.',
                ),
                Text("Cảm ơn bạn đã giúp mở rộng Music Learn!"),
              ],
            ),
            actions: [
              Row(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Add Other Request"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.explore);
                    },
                    child: Text('Explore'),
                  ),
                ],
              ),
            ],
          ),
    );
  }
}
