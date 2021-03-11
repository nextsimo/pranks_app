import 'package:flutter/material.dart';
import 'package:prank/src/services/wallpapers_service.dart';
import 'package:prank/src/utils/locator.dart';
import 'package:prank/src/view/base/base_view.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WallpapersService>.value(value: papersService),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BaseView(),
      ),
    );
  }
}
