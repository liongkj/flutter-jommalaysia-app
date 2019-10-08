class ApiResponse {
  dynamic data;
  bool success;

  ApiResponse({this.data, this.success});

  factory ApiResponse.fromJson(dynamic parsedJson) {
    dynamic data = parsedJson["data"];
    bool success = parsedJson["success"];
    return new ApiResponse(
      success: success,
      data: data,
    );
  }
}
