import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar());
  }

  _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(75.0),
      child: AppBar(
        leading: Icon(Icons.local_hospital),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: PhysicalModel(
            color: Colors.white,
            elevation: 14,
            borderRadius: BorderRadius.circular(10.0),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(8.0),
              ),
            ),
          ),
        ),
        elevation: 0,
      ),
    );
  }
}
