class Switching {
  bool? status;
  final int? id;
  String? title;
  String? subtitle;
  Switching({this.id, this.status, this.subtitle, this.title});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Switching && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
