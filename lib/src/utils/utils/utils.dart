import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:line_icons/line_icons.dart';

class Utils {
  static Size getscreensize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
  static const icones = <IconData>[


    Icons.speed,
    Icons.apartment,
    Icons.map,
    Icons.account_balance,
    Icons.account_circle_outlined,
    Icons.work_outline_rounded,
    Icons.apps,
    Icons.star,
    Icons.airport_shuttle,
    Icons.carpenter_outlined,
    Icons.view_sidebar_outlined,
    Icons.agriculture,
    Icons.anchor,
    Icons.airline_seat_flat,
    Icons.add_a_photo_outlined,
    Icons.watch,
    Icons.flag_outlined,
    Icons.album_outlined,
    Icons.assessment,
    Icons.architecture_outlined,
    Icons.view_compact,
    Icons.backup_table,
    Icons.campaign_outlined,
    Icons.desktop_windows_outlined,
    Icons.emoji_events_outlined,
    Icons.fastfood_outlined,
    Icons.filter_vintage_sharp,
    Icons.handyman_rounded,

  ];
  static const iconesRoles = <IconData>[
    LineIcons.user,
    LineIcons.shoppingBag,
    LineIcons.galacticEmpire,
    LineIcons.pagelines,
    LineIcons.safari,
    LineIcons.igloo,
  ];

  static List<String> meses = [
    "","JAN","FEV","MAR","ABR","MAI","JUN","JUL","AGO","SET","OUT","NOV","DEZ"
  ];

  static List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.brown,
    Colors.cyanAccent,
    Colors.pink,
    Colors.teal,
    Colors.lime,
    Colors.grey,
    Colors.greenAccent,
  ];

  static List<Color> colorPrioridade = [
    Colors.grey,
    Colors.green,
    Colors.amber,
    Colors.red,
    Colors.purple
  ];


  static List<Color> colorStatus = [
    Colors.green,
    Colors.amber,
    Colors.orange,
    Colors.blue,
    Colors.red,
    Colors.cyanAccent,
    Colors.purpleAccent,
    Colors.pink,
    Colors.blue,
    Colors.orange,
    Colors.red,
    Colors.purple
  ];



}

