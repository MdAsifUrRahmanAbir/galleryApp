

// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gallery_app/Model.dart';
import 'package:http/http.dart' as http;

class ProviderController with ChangeNotifier {
  List<Model> modelList = [];

  getOrderData()async {
    modelList = await fetchData();
    notifyListeners();
  }

  fetchData() async{
    List<Model> orderList = [];
    late Model model;

    var responce = await http.get(Uri.parse('https://picsum.photos/v2/list?fbclid=IwAR2qk2kE60PcFr1S3OdDKwH9v6bhfWzmIaByJTvViW2iVnLMtDC4Lg7IyeI'));

    print("Status Code ${responce.statusCode}");

    if (responce.statusCode == 200) {
      var data = jsonDecode(responce.body);
      print("Order list are $data");
      for (var item in data) {
        model = Model.fromJson(item);
        orderList.add(model);
      }
    }
    return orderList;
  }
}