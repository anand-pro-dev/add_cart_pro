import 'package:add_to_card_provider/main_screen.dart';
import 'package:add_to_card_provider/provider/pro_provider.dart';
import 'package:add_to_card_provider/services/view/dummy.dart';
import 'package:add_to_card_provider/services/view/type_one_with_out.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///   flutter build apk --release
///  flutter build appbundle --target-platform android-arm,android-arm64,android-x64
///  flutter build appbundle --target-platform android-arm
/// flutter build apk --analyze-size --target-platform android-arm
/// flutter run -d chrome --web-browser-flag "--disable-web-security"
///   F:\@ Program_Files\flutter\bin\cache\dart-sdk
///

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => AddtoCartOffine()),
        ChangeNotifierProvider(create: (_) => CircleAvatarProvider()),
        ChangeNotifierProvider(create: (_) => LikeDislikeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Project',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: TodoNoModel(),
        // home: MyAppdd(),
      ),
    );
  }
}
