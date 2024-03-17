class ClockInUserList {
  final List<ClockInUserListItem> userClockInDataDTOs;
  final String userName;

  ClockInUserList({
    this.userClockInDataDTOs = const [],
    this.userName = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userClockInDataDTOs': userClockInDataDTOs.map((x) => x.toMap()).toList(),
      'userName': userName,
    };
  }

  factory ClockInUserList.fromMap(Map<String, dynamic> map) {
    return ClockInUserList(
      userName: map['userName'] ?? '',
      userClockInDataDTOs: map['userClockInDataDTOs'] != null
          ? List<ClockInUserListItem>.from(
              (map['userClockInDataDTOs'] as List).map<ClockInUserListItem>(
                (x) => ClockInUserListItem.fromMap(x),
              ),
            )
          : [],
    );
  }
  factory ClockInUserList.dummy() {
    return ClockInUserList(
      userClockInDataDTOs: List.generate(5, (index) {
        return ClockInUserListItem();
      }),
    );
  }
}

class ClockInUserListItem {
  final String divisionName;
  final String clockInDate;
  final String clockType;
  final bool lateFlag;

  ClockInUserListItem({
    this.divisionName = '',
    this.clockInDate = '',
    this.clockType = '',
    this.lateFlag = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'divisionName': divisionName,
      'clockInDate': clockInDate,
      'clockType': clockType,
      'lateFlag': lateFlag,
    };
  }

  factory ClockInUserListItem.fromMap(Map<String, dynamic> map) {
    return ClockInUserListItem(
      divisionName: map['divisionName'] ?? '',
      clockInDate: map['clockInDate'] ?? '',
      clockType: map['clockType'] ?? '',
      lateFlag: map['lateFlag'] ?? false,
    );
  }
}
