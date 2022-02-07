import 'package:flutter/material.dart';

abstract class BaseStatefull extends StatefulWidget {
  const BaseStatefull({Key? key}) : super(key: key);

  @override
  StatefulElement createElement() {
    return StatefulElement(this);
  }
}
