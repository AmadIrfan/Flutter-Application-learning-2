import 'package:flutter/material.dart';
import '../single_page_application/list_builder.dart';

class SPAMainPage extends StatefulWidget {
  const SPAMainPage({super.key});
  static const routName = '/s_page';

  @override
  State<SPAMainPage> createState() => _SPAMainPageState();
}

class _SPAMainPageState extends State<SPAMainPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ListBuilders(),
    );
  }
}
