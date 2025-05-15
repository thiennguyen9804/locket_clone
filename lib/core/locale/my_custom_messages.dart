import 'package:timeago/timeago.dart';

class MyVietnameseMessages implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => 'trong';
  @override
  String suffixAgo() => 'trước';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'vừa xong';
  @override
  String aboutAMinute(int minutes) => '1 phút';
  @override
  String minutes(int minutes) => '$minutes phút';
  @override
  String aboutAnHour(int minutes) => 'khoảng 1 giờ';
  @override
  String hours(int hours) => '$hours giờ';
  @override
  String aDay(int hours) => '1 ngày';
  @override
  String days(int days) => '$days ngày';
  @override
  String aboutAMonth(int days) => 'khoảng 1 tháng';
  @override
  String months(int months) => '$months tháng';
  @override
  String aboutAYear(int year) => 'khoảng 1 năm';
  @override
  String years(int years) => '$years năm';
  @override
  String wordSeparator() => ' ';
}
