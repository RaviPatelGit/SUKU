String timeAgo(int secondsUnixTimestamp) {
  final timestamp =
      DateTime.fromMillisecondsSinceEpoch(secondsUnixTimestamp * 1000);
  final duration = DateTime.now().difference(timestamp);
  String timeAgo;
  if (duration.inDays > 365) {
    timeAgo = '${(duration.inDays / 365).floor()}Y';
  } else if (duration.inDays >= 30) {
    timeAgo = '${(duration.inDays / 30).floor()}M';
  } else if (duration.inDays >= 7) {
    timeAgo = '${(duration.inDays / 7).floor()}W';
  } else if (duration.inDays >= 1) {
    timeAgo = '${duration.inDays}D';
  } else if (duration.inHours >= 1) {
    timeAgo = '${duration.inHours}H';
  } else if (duration.inMinutes > 1) {
    timeAgo = '${duration.inMinutes}m';
  } else {
    timeAgo = '${duration.inSeconds}s';
  }
  return timeAgo;
}
