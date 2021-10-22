class ResponseData {
  String? code;
  String? type;
  String? message;
  String? token;
  String? noMember;
  int? status;
  dynamic data;

  ResponseData({this.code, this.type, this.message});

  ResponseData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    type = json['type'];
    message = json['message'];
    token = json['token'];
    noMember = json['no_member'];
    status = json['status'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['type'] = type;
    data['message'] = message;
    data['token'] = token;
    data['no_member'] = noMember;
    data['status'] = status;
    data['data'] = data;
    return data;
  }
}
