
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Box hiveBox = Hive.box('settings');
bool onboardingComplete = hiveBox.get('onboardingComplete', defaultValue: false);