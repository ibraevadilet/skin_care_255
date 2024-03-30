class JHKHfsfs {
  final String sdfdf1;
  final String sdfsdfsdf2;
  final String sdfsfs3;
  final String sdfdfsf4;
  final bool sdfsdfis;
  JHKHfsfs({
    required this.sdfdf1,
    required this.sdfsdfsdf2,
    required this.sdfsfs3,
    required this.sdfdfsf4,
    required this.sdfsdfis,
  });

  factory JHKHfsfs.fromJson(Map<String, dynamic> map) {
    return JHKHfsfs(
      sdfdf1: map['sdfdf1'],
      sdfsdfsdf2: map['sdfsdfsdf2'],
      sdfsfs3: map['sdfsfs3'],
      sdfdfsf4: map['sdfdfsf4'],
      sdfsdfis: map['sdfsdfis'],
    );
  }

  @override
  String toString() {
    return 'JHKHfsfs(sdfdf1: $sdfdf1, sdfsdfsdf2: $sdfsdfsdf2, sdfsfs3: $sdfsfs3, sdfdfsf4: $sdfdfsf4, sdfsdfis: $sdfsdfis)';
  }
}
