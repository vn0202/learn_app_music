import 'package:flutter/material.dart';
import 'package:music_app/pages/home/list_genre.dart';
import '../widgets/inc/appbar.dart';
import '../components/banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(title: "helo"),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyBanner(),
              SizedBox(height: 24),
              ListGenre(),
              Container(
                padding: EdgeInsets.all(40.0),
                alignment: Alignment.center,
                color: Colors.deepPurple,

                child: Text("Hello world"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
