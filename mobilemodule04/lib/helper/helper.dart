class Helper {
  static final Helper _instance = Helper._internal();
  factory Helper() {
    return _instance;
  }

  Helper._internal();

  String convertDate(DateTime date) {
    return "${date.year}/${date.month}/${date.day} ${date.hour}:${date.minute}";
  }
}
