import 'package:flutter/material.dart';
import 'package:music_app/models/vocabulary.dart';
import 'package:music_app/components/vocabulary/vocabulary_item.dart';
import 'package:music_app/themes/app_text_themes.dart';

class VocabulariesSection extends StatelessWidget {
  const VocabulariesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Future<List<Vocabulary>> vocabularies;
    vocabularies = Vocabulary.fetchFromDatabase();

    return FutureBuilder(
      future: vocabularies,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Vocabularies (${snapshot.data!.length})",
              style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                controller: ScrollController(),
                separatorBuilder: (context, index) => const Divider(),

                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final vocabulary = snapshot.data![index];
                  return VocabularyItemLayout(vocabulary: vocabulary);
                },
                itemCount: snapshot.data!.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
