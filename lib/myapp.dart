import 'package:contect_dairyapp/view/splashSCreen/splashscreen.dart';
import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'controllers/bottomnavigation/bottomnavigation.dart';
import 'controllers/contact/contactcontrllers.dart';
import 'main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'models/contact_model.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return ScreenUtilInit(
      designSize: Size(
        size.width,
        size.height,
      ),
      minTextAdapt: true,
      builder: (context, _) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => ContactController(
                contactsModel: ContactsModel(
                  phoneList: phoneList,
                  nameList: nameList,
                  emailList: emailList,
                  isTheme: isTheme ?? false,
                  userName: userName ?? "0",
                  userPhone: userPhone ?? "0" '',
                ),
              ),
            ),
            ChangeNotifierProvider(
              create: (_) => BottomnavigationBarController(),
            )
          ],
          child: Consumer<ContactController>(
            builder: (context, value, _) {
              return Flexify(
                designWidth: size.width,
                designHeight: size.height,
                app: MaterialApp(
                  home: const SplashScreen(),
                  debugShowCheckedModeBanner: false,
                  theme: value.isTheme ? ThemeData.dark() : ThemeData.light(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
