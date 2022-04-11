class ResponseData {
  int? code;
  String? type;
  String? message;
  String? token;
  String? noMember;
  String? status;
  Map<String, dynamic>? map;

  ResponseData({this.code, this.type, this.message});

  ResponseData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    type = json['type'];
    message = json['message'];
    token = json['token'];
    noMember = json['no_member'];
    status = json['status'];
    map = json['data'] != null ? json['data'] as Map<String, dynamic> : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['type'] = type;
    data['message'] = message;
    data['token'] = token;
    data['no_member'] = noMember;
    data['status'] = status;
    data['data'] = map;
    return data;
  }
}

// class Data {
//   String? status;
//   int? active;
//   String? noMember;

//   Data.fromJson(Map<String, dynamic> json) {
//     noMember = json['no_member'];
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['no_member'] = noMember;
//     data['status'] = status;
//     data['data'] = data;
//     return data;
//   }
// }
