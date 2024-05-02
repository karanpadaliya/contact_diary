import 'package:flutter/material.dart';

class ViewContact extends StatefulWidget {
  const ViewContact({super.key});

  @override
  State<ViewContact> createState() => _ViewContactState();
}

class _ViewContactState extends State<ViewContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
      ),
    );
  }
}
