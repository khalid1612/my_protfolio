import 'package:flutter/material.dart';

class UserInfoModel {
  String bssid;
  String ssid;
  String ip;
  String macAddress;
  int linkSpeed;
  int singalStrength;
  int frequency;
  int networkid;
  String connectionType;
  bool isHiddenSSI;
  String routerIp;
  String dns1Ip;
  String dns2Ip;

  UserInfoModel({
    @required String bssid,
    @required String ssid,
    @required String ip,
    @required String macAddress,
    @required int linkSpeed,
    @required int singalStrength,
    @required int frequency,
    @required int networkid,
    @required String connectionType,
    @required bool isHiddenSSI,
    @required String routerIp,
    @required String dns1Ip,
    @required String dns2Ip,
  });
}
