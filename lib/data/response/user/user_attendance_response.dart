class UserAttendanceResponse {
  final List<UserAttendanceResponseItem> userAttendanceListingDTOs;
  final num totalCount;

  UserAttendanceResponse({
    this.userAttendanceListingDTOs = const [],
    this.totalCount = 0,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userAttendanceListingDTOs':
          userAttendanceListingDTOs.map((x) => x.toMap()).toList(),
      'totalCount': totalCount,
    };
  }

  factory UserAttendanceResponse.fromMap(Map<String, dynamic> map) {
    return UserAttendanceResponse(
      totalCount: map['totalCount'] ?? 0,
      userAttendanceListingDTOs: map['userAttendanceListingDTOs'] != null
          ? List<UserAttendanceResponseItem>.from(
              (map['userAttendanceListingDTOs'] as List)
                  .map<UserAttendanceResponseItem>(
                (x) => UserAttendanceResponseItem.fromMap(x),
              ),
            )
          : [],
    );
  }
}

class UserAttendanceResponseItem {
  final String userName;
  final String divisionName;
  final num mk;
  final num ls;
  final num ln;
  final num skd;
  final num ct;
  final num disp;
  final num ot;

  UserAttendanceResponseItem({
    this.userName = '',
    this.divisionName = '',
    this.mk = 0,
    this.ls = 0,
    this.ln = 0,
    this.skd = 0,
    this.ct = 0,
    this.disp = 0,
    this.ot = 0,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'divisionName': divisionName,
      'mk': mk,
      'ls': ls,
      'ln': ln,
      'skd': skd,
      'ct': ct,
      'disp': disp,
      'ot': ot,
    };
  }

  factory UserAttendanceResponseItem.fromMap(Map<String, dynamic> map) {
    return UserAttendanceResponseItem(
      userName: map['userName'] ?? '',
      divisionName: map['divisionName'] ?? '',
      mk: map['mk'] ?? 0,
      ls: map['ls'] ?? 0,
      ln: map['ln'] ?? 0,
      skd: map['skd'] ?? 0,
      ct: map['ct'] ?? 0,
      disp: map['disp'] ?? 0,
      ot: map['ot'] ?? 0,
    );
  }
}
