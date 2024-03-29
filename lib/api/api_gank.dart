import 'dart:async';

import 'package:art/models/DailyInfo.dart';
import 'package:art/models/HistoryList.dart';
import 'package:art/models/MsgInfo.dart';
import 'package:art/models/PageList.dart';
import 'package:art/api/http_gank.dart';

/// gank信息获取
class GankApi {
  static Future<PageList> getListData(String type, int count, int pageIndex) async {
    var response = await HttpGank.getJson("data/$type/$count/$pageIndex", {});
    return PageList.fromJson(response);
  }

  static Future<DailyInfo> getDailyInfo(String date) async {
    var response = await HttpGank.getJson("day/$date", {});
    return DailyInfo.fromJson(response);
  }

  static Future<DailyInfo> getToday() async {
    var response = await HttpGank.getJson("today", {});
    return DailyInfo.fromJson(response);
  }

  static Future<HistoryList> getHistory(int count, int pageIndex) async {
    var response =
        await HttpGank.getJson("history/content/$count/$pageIndex", {});
    return HistoryList.fromJson(response);
  }

  static Future<MsgInfo> release(Map<String, dynamic> map) async {
    var response = await HttpGank.postForm("add2gank", map);
    return MsgInfo.fromJson(response);
  }
}
