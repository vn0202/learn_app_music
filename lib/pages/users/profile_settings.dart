import 'package:flutter/material.dart';
import 'package:music_app/pages/modals/switch_langugae.dart';
import 'package:music_app/providers/user_preferences.dart';
import 'package:music_app/themes/app_colors.dart';
import 'package:music_app/themes/app_text_themes.dart';
import 'package:music_app/widgets/inc/footer.dart';
import 'package:provider/provider.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  final mainTextStyle = AppTextTheme.lightTextTheme.titleMedium!.copyWith(
    fontWeight: FontWeight.bold,
  );
  final formBasicInfoKey = GlobalKey<FormState>();
  final formBasicPasswordKey = GlobalKey<FormState>();
  final formUserPreferenceKey = GlobalKey<FormState>();
  final List languageOptions = SwitchLangugae.supportedLanguages;

  bool isEditingTargetLanguage = false;
  bool isEditingFavoriteCategories = false;

  @override
  Widget build(BuildContext context) {
    final userPreference = context.watch<UserPreferencesProvider>();
    var currentInterfacelanguage = userPreference.interfaceLanguage;
    final targetedLanguagesCode = userPreference.targetLanguages;

    final targetedLanguages =
        languageOptions.where((lang) {
          return targetedLanguagesCode.contains(lang['value']);
        }).toList();

    return Scaffold(
      appBar: AppBar(title: Text("Cai dat tai khoan")),
      bottomNavigationBar: Footer(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBasicInfo(),
              SizedBox(height: 32),
              _buildFormBasicInfo(),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),

              _buildManagePasswordForm(),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              _buildUserPreferences(
                currentInterfacelanguage,
                userPreference,
                targetedLanguages,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildUserPreferences(
    String currentInterfacelanguage,
    UserPreferencesProvider userPreference,
    List<dynamic> targetedLanguages,
  ) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Language and Preferences", style: mainTextStyle),
          SizedBox(height: 16),
          Text("Languages", style: mainTextStyle.copyWith(fontSize: 16)),
          SizedBox(height: 16),
          Row(
            spacing: 12,
            children: [
              Text(
                "Ngon ngu giao dien",
                style: mainTextStyle.copyWith(fontSize: 16),
              ),
              DropdownButton(
                value: currentInterfacelanguage,
                items:
                    languageOptions.map((e) {
                      return DropdownMenuItem(
                        value: e['value'],
                        child: Row(
                          spacing: 12,
                          children: [
                            Image.asset(e['flag'], width: 40, height: 40),
                            Text(e['name']),
                          ],
                        ),
                      );
                    }).toList(),
                onChanged: (value) {
                  userPreference.updateInterfaceLanguage(value.toString());
                },
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Target languages",
                style: mainTextStyle.copyWith(fontSize: 16),
              ),
              isEditingTargetLanguage
                  ? TextButton(
                    onPressed:
                        () => {
                          setState(() {
                            isEditingTargetLanguage = false;
                          }),
                        },
                    child: Text(
                      "Hoan tat",
                      style: mainTextStyle.copyWith(
                        fontSize: 16,
                        color: AppColors.primary,
                      ),
                    ),
                  )
                  : TextButton.icon(
                    onPressed:
                        () => {
                          setState(() {
                            isEditingTargetLanguage = true;
                          }),
                        },
                    icon: Icon(Icons.settings),
                    label: Text(
                      "Chinh sua",
                      style: mainTextStyle.copyWith(
                        fontSize: 16,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
            ],
          ),
          isEditingTargetLanguage
              ? Column(
                children:
                    languageOptions.map((lang) {
                      return CheckboxListTile(
                        title: Row(
                          spacing: 12,
                          children: [
                            Image.asset(lang['flag'], width: 32, height: 32),
                            Text(lang['name']),
                          ],
                        ),
                        onChanged:
                            (_) => userPreference.toggleTargetLanguage(
                              lang['value'],
                            ),

                        value: userPreference.isTargetLanguageSelected(
                          lang['value'],
                        ),
                      );
                    }).toList(),
              )
              : Wrap(
                spacing: 12,
                runSpacing: 12,
                children:
                    targetedLanguages.map((lang) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: 1, color: AppColors.border),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        child: Text(lang['name']),
                      );
                    }).toList(),
              ),

          SizedBox(height: 16),
          Text("Preferences", style: mainTextStyle.copyWith(fontSize: 16)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Favorite Categories",
                style: mainTextStyle.copyWith(fontSize: 16),
              ),
              isEditingFavoriteCategories
                  ? TextButton(
                    onPressed:
                        () => {
                          setState(() {
                            isEditingFavoriteCategories = false;
                          }),
                        },
                    child: Text(
                      "Hoan tat",
                      style: mainTextStyle.copyWith(
                        fontSize: 16,
                        color: AppColors.primary,
                      ),
                    ),
                  )
                  : TextButton.icon(
                    onPressed:
                        () => {
                          setState(() {
                            isEditingFavoriteCategories = true;
                          }),
                        },
                    icon: Icon(Icons.settings),
                    label: Text(
                      "Chinh sua",
                      style: mainTextStyle.copyWith(
                        fontSize: 16,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
            ],
          ),
          isEditingFavoriteCategories
              ? Column(
                children:
                    languageOptions.map((lang) {
                      return CheckboxListTile(
                        title: Row(
                          spacing: 12,
                          children: [
                            Image.asset(lang['flag'], width: 32, height: 32),
                            Text(lang['name']),
                          ],
                        ),
                        onChanged:
                            (_) => userPreference.toggleTargetLanguage(
                              lang['value'],
                            ),

                        value: userPreference.isTargetLanguageSelected(
                          lang['value'],
                        ),
                      );
                    }).toList(),
              )
              : Wrap(
                spacing: 12,
                runSpacing: 12,
                children:
                    targetedLanguages.map((lang) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: 1, color: AppColors.border),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        child: Text(lang['name']),
                      );
                    }).toList(),
              ),
        ],
      ),
    );
  }

  Form _buildManagePasswordForm() {
    return Form(
      key: formBasicPasswordKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Manage your password", style: mainTextStyle),
          SizedBox(height: 24),

          Text("New password", style: mainTextStyle.copyWith(fontSize: 16)),
          SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Your password",
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Verify new password",
            style: mainTextStyle.copyWith(fontSize: 16),
          ),
          SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Verify new password",
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(onPressed: () {}, child: Text("Save")),
          ),
        ],
      ),
    );
  }

  Form _buildFormBasicInfo() {
    return Form(
      key: formBasicInfoKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Name", style: mainTextStyle),
          SizedBox(height: 4),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Your name",
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text("Email", style: mainTextStyle),
          SizedBox(height: 4),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Your email",
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text("Phone", style: mainTextStyle),
          SizedBox(height: 4),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Your phone number",
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(onPressed: () {}, child: Text("Save")),
          ),
        ],
      ),
    );
  }

  DefaultTextStyle _buildBasicInfo() {
    return DefaultTextStyle(
      style: mainTextStyle,
      child: SizedBox(
        width: double.infinity,

        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Thong tin  ca nhan"),
            Center(child: CircleAvatar(radius: 50)),
            Align(alignment: Alignment.center, child: Text("Doi anh dai dien")),
          ],
        ),
      ),
    );
  }
}
