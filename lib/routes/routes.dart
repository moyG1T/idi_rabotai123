import 'package:idi_rabotai123/ui/home.dart';
import 'package:idi_rabotai123/ui/pages/authorization.dart';
import 'package:idi_rabotai123/ui/pages/registration.dart';

final routes = {
  '/': (context) => const AuthorizationPage(),
  '/reg': (context) => const RegistrationPage(),
  '/home': (context) => const HomePage(),
};