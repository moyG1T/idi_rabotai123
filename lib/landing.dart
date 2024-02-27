import 'package:flutter/material.dart';
import 'package:idi_rabotai123/database/firebaseAuth/user.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel? userModel = Provider.of<UserModel?>(context);
  }
}