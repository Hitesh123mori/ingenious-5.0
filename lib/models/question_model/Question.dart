import 'package:ingenious_5/apis/FirebaseAPIs.dart';
import 'package:ingenious_5/models/message_model.dart';

/// qID : ""
/// text : ""
/// vote : 1223
/// domain : ["asd","sad"]
/// isGloble : false
/// userId : ""
/// userName : ""
/// userType : ""
/// creatTime : ""
/// answer : [{"aId":"","text":"","vote":23123,"userId":"","userName":"","userType":"","createTime":""},{"aId":"","text":"","vote":23123,"userId":"","userName":"","userType":"","createTime":""},{"aId":"","text":"","vote":23123,"userId":"","userName":"","userType":"","createTime":""}]

class Question {
  Question({
    this.qID,
      this.text, 
      this.vote, 
      this.domain, 
      this.isGlobal,
      this.userId, 
      this.userName, 
      this.userType, 
      this.createTime,
      this.chat,});

  Question.fromJson(dynamic json) {
    qID = json['qID'];
    text = json['text'];
    vote = json['vote'];
    domain = json['domain'] != null ? json['domain'].cast<String>() : [];
    isGlobal = json['isGlobal'];
    userId = json['userId'];
    userName = json['userName'];
    userType = json['userType'];
    createTime = json['createTime'];
    if (json['chats'] != null) {
      chat = [];
      json['chats'].forEach((k, v) {
        var t = v as Map<dynamic, dynamic>;
        print("#v: ${t}");
        chat?.add(DoubtMessage.fromJson(t));
      });
    }
  }
  String? qID;
  String? text;
  num? vote;
  List<String>? domain;
  bool? isGlobal;
  String? userId;
  String? userName;
  String? userType;
  String? createTime;
  List<DoubtMessage>? chat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['qID'] = qID;
    map['text'] = text;
    map['vote'] = vote;
    map['domain'] = domain;
    map['isGlobal'] = isGlobal;
    map['userId'] = userId;
    map['userName'] = userName;
    map['userType'] = userType;
    map['createTime'] = createTime;
    if (chat != null) {
      Map<dynamic, dynamic> ansMap = {};
      chat?.map((v) {
        ansMap[v.cId] = v;
      });
      map['chat'] = ansMap.isNotEmpty? ansMap: null;
    }
    return map;
  }

}