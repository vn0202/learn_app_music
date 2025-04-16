import 'package:flutter/material.dart';

class ReportVideo extends StatefulWidget {
  final bool showText;
  final String videoId;
  const ReportVideo({super.key, required this.showText, required this.videoId});

  @override
  State<ReportVideo> createState() => _ReportVideoState();
}

class _ReportVideoState extends State<ReportVideo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: const EdgeInsets.all(0),
          ),
          onPressed: () {
            // Handle report action
          },
          child: Row(
            children: [
              Icon(Icons.report, color: Colors.grey),
              if (widget.showText)
                Text('Report', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ],
    );
  }
}
