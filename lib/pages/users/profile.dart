import 'package:flutter/material.dart';
import 'package:music_app/themes/app_colors.dart';
import 'package:music_app/themes/app_text_themes.dart';
import 'package:music_app/widgets/inc/footer.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      bottomNavigationBar: Footer(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            spacing: 12,
            children: [
              _buildBaseInfo(),
              SizedBox(height: 12),
              _buildProfileItem("Cai dat tai khoan"),
              _buildProfileItem("Video da xem"),
              _buildProfileItem("Video da luu"),
              _buildProfileItem("Video da yeu cau "),
              _buildProfileItem("Sign Out "),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _buildProfileItem(String text, [VoidCallback? onTap]) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border(
            top: BorderSide(width: 1),
            left: BorderSide(width: 1),
            bottom: BorderSide(width: 2),
            right: BorderSide(width: 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: AppTextTheme.lightTextTheme.titleMedium!),
            Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }

  Container _buildBaseInfo() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        spacing: 12,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(
              "https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/anh-dep-thien-nhien-thump.jpg",
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 6,
            children: [
              Text(
                "Hell Angel",
                style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "hellangel@gmail.com",
                style: AppTextTheme.lightTextTheme.titleSmall!.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
