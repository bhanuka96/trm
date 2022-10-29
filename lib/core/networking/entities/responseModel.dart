class ResponseModel<T> {
  final T body;

  const ResponseModel({
    required this.body,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      body: json as T,
    );
  }
}