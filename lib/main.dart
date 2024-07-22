import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const RateCryptoApp());
}

class RateCryptoApp extends StatelessWidget {
  const RateCryptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          dividerTheme: const DividerThemeData(
            color: Colors.white10,
          ),
          listTileTheme: const ListTileThemeData(iconColor: Colors.white),
          appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 34, 34, 34),
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              )),
          scaffoldBackgroundColor: const Color.fromARGB(255, 34, 34, 34),
          textTheme: TextTheme(
            bodyMedium: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            labelSmall: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          )),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('crypto app'),
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemCount: 10,
          itemBuilder: (context, index) => ListTile(
            trailing: const Icon(Icons.arrow_forward_ios),
            leading: SvgPicture.asset(
              'assets/svg/bitcoin.svg',
              width: 40,
              height: 40,
            ),
            title: Text(
              'Bitcoin',
              style: theme.textTheme.bodyMedium,
            ),
            subtitle: Text('Цена', style: theme.textTheme.labelSmall),
          ),
        ));
  }
}
