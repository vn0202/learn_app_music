// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class LyricsSection extends StatefulWidget {
//   final VideoPlayerController videoController;
//   final Future<List<Map<String, dynamic>>>
//   lyricsFuture; // Future to fetch lyrics

//   const LyricsSection({
//     Key? key,
//     required this.videoController,
//     required this.lyricsFuture,
//   }) : super(key: key);

//   @override
//   _LyricsSectionState createState() => _LyricsSectionState();
// }

// class _LyricsSectionState extends State<LyricsSection> {
//   int currentLyricIndex = 0;
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     widget.videoController.addListener(_updateCurrentLyric);
//   }

//   @override
//   void dispose() {
//     widget.videoController.removeListener(_updateCurrentLyric);
//     _scrollController.dispose();
//     super.dispose();
//   }

//   void _updateCurrentLyric(List<Map<String, dynamic>> lyrics) {
//     final currentTime = widget.videoController.value.position.inMilliseconds;
//     for (int i = 0; i < lyrics.length; i++) {
//       if (currentTime >= lyrics[i]['time'] &&
//           (i == lyrics.length - 1 || currentTime < lyrics[i + 1]['time'])) {
//         if (currentLyricIndex != i) {
//           setState(() {
//             currentLyricIndex = i;
//           });
//           _scrollToCurrentLyric();
//         }
//         break;
//       }
//     }
//   }

//   void _scrollToCurrentLyric() {
//     _scrollController.animateTo(
//       currentLyricIndex * 50.0, // Assuming each lyric item has a height of 50.0
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeInOut,
//     );
//   }

//   void _onLyricTap(int index, List<Map<String, dynamic>> lyrics) {
//     widget.videoController.seekTo(
//       Duration(milliseconds: lyrics[index]['time']),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Map<String, dynamic>>>(
//       future: widget.lyricsFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const Center(child: Text('No lyrics available'));
//         }

//         final lyrics = snapshot.data!;
//         widget.videoController.addListener(() => _updateCurrentLyric(lyrics));

//         return Container(
//           height: MediaQuery.of(context).size.height * 0.5,
//           color: Colors.black,
//           child: ListView.builder(
//             controller: _scrollController,
//             itemCount: lyrics.length,
//             itemBuilder: (context, index) {
//               final isCurrent = index == currentLyricIndex;
//               return GestureDetector(
//                 onTap: () => _onLyricTap(index, lyrics),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 8.0,
//                     horizontal: 16.0,
//                   ),
//                   child: Text(
//                     lyrics[index]['text'],
//                     style: TextStyle(
//                       fontSize: isCurrent ? 20.0 : 16.0,
//                       fontWeight:
//                           isCurrent ? FontWeight.bold : FontWeight.normal,
//                       color: isCurrent ? Colors.white : Colors.grey,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
