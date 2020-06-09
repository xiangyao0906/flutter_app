class BaseModel<T> {
  int code;
  T data;
  String error;

  BaseModel({this.code, this.data, this.error});

  BaseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'];
    error = json['error'];
  }
}