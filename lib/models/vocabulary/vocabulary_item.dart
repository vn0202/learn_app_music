import 'package:flutter/material.dart';
import 'package:music_app/core/utils/time_utils.dart';
import 'package:music_app/models/vocabulary.dart';
import 'package:music_app/themes/app_colors.dart';
import 'package:music_app/themes/app_text_themes.dart';

class VocabularyItemLayout extends StatefulWidget {
  final Vocabulary vocabulary;
  const VocabularyItemLayout({super.key, required this.vocabulary});

  @override
  State<VocabularyItemLayout> createState() => _VocabularyItemLayoutState();
}

class _VocabularyItemLayoutState extends State<VocabularyItemLayout> {
  bool isPlaying = false;
  getColor() {
    switch (widget.vocabulary.cefrLevel) {
      case 'A1':
        return AppColors.cefrLevelA1;
      case 'A2':
        return AppColors.cefrLevelA2;
      case 'B1':
        return AppColors.cefrLevelB1;
      case 'B2':
        return AppColors.cefrLevelB2;
      case 'C1':
        return AppColors.cefrLevelC1;
      default:
        return AppColors.cefrLevelC2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Column
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.vocabulary.word,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      speakText(
                        widget.vocabulary.word,
                        startHandler: () {
                          setState(() {
                            isPlaying = true;
                          });
                        },
                        completeHandler:
                            () => setState(() {
                              isPlaying = false;
                            }),
                        errorHandler:
                            (message) => setState(() {
                              isPlaying = false;
                            }),
                        pauseHandler:
                            () => setState(() {
                              isPlaying = false;
                            }),
                      );
                    },
                    icon: Icon(
                      Icons.volume_up,
                      color:
                          isPlaying
                              ? AppColors.secondary
                              : AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(widget.vocabulary.pronunciation),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                decoration: BoxDecoration(
                  color: getColor(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  widget.vocabulary.cefrLevel,
                  style: AppTextTheme.lightTextTheme.titleSmall!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 16),
        // Right Column
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.vocabulary.partOfSpeech,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(widget.vocabulary.meaningString),
            ],
          ),
        ),
      ],
    );
  }
}
