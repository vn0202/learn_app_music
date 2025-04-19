import 'package:flutter/material.dart';
import 'package:music_app/pages/modals/switch_langugae.dart';
import 'package:music_app/pages/modals/search.dart';
import 'package:music_app/providers/user_preferences.dart';
import 'package:music_app/routes/route_names.dart';
import 'package:music_app/themes/app_colors.dart';
import 'package:music_app/themes/app_text_themes.dart';
import 'package:provider/provider.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const Appbar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 3,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [LanguageSwitcher(), Search()],
      ),
    );
  }
}

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final userPreferencesProvider = Provider.of<UserPreferencesProvider>(
      context,
    );

    final interfaceLanguage = userPreferencesProvider.currentLanguageInfo;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const SwitchLangugae(),
            transitionsBuilder: (_, animation, __, child) {
              const begin = Offset(-1.0, 0.0); // từ trái
              const end = Offset.zero;
              const curve = Curves.easeInOut;

              var tween = Tween(
                begin: begin,
                end: end,
              ).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            fullscreenDialog: true, // modal full screen),
          ),
        );
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 12,
            backgroundImage: AssetImage(interfaceLanguage['flag']!),
          ),
          SizedBox(width: 8),
          Text(
            interfaceLanguage['name'],
            style: AppTextTheme.lightTextTheme.bodyLarge!.copyWith(),
          ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => SearchPage(),
            transitionsBuilder: (_, animation, _, child) {
              const begin = Offset(-1.0, 0.0); // từ trái
              const end = Offset.zero;
              const curve = Curves.easeInOut;
              var tween = Tween(
                begin: begin,
                end: end,
              ).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        );
      },
      icon: Icon(Icons.search, color: AppColors.textPrimary),
    );
  }
}
