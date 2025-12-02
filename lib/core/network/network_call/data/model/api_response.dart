class ApiResponse<T> {
  final T data;
  final int statusCode;

  ApiResponse({required this.data, required this.statusCode});
}
