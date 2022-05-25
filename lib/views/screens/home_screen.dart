import 'dart:convert';

import 'package:fetchnews/utils/httpfile.dart';
import 'package:fetchnews/utils/httpfile.dart';
import 'package:flutter/material.dart';

import '../../models/article.dart';

import '../../utils/httpfile.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Articles> articleList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text(articleList[0].author ?? "emPty"));
  }
}
