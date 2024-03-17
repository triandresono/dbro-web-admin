class ClockInUserListResponse {
  final List<ClockInUserListResponseItem> userClockInDataDTOs;
  final String userName;

  ClockInUserListResponse({
    this.userClockInDataDTOs = const [],
    this.userName = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userClockInDataDTOs': userClockInDataDTOs.map((x) => x.toMap()).toList(),
      'userName': userName,
    };
  }

  factory ClockInUserListResponse.fromMap(Map<String, dynamic> map) {
    return ClockInUserListResponse(
      userName: map['userName'] ?? '',
      userClockInDataDTOs: map['userClockInDataDTOs'] != null
          ? List<ClockInUserListResponseItem>.from(
              (map['userClockInDataDTOs'] as List)
                  .map<ClockInUserListResponseItem>(
                (x) => ClockInUserListResponseItem.fromMap(x),
              ),
            )
          : [],
    );
  }
}

class ClockInUserListResponseItem {
  final String divisionName;
  final String clockInDate;
  final String clockType;
  final bool lateFlag;

  ClockInUserListResponseItem({
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

  factory ClockInUserListResponseItem.fromMap(Map<String, dynamic> map) {
    return ClockInUserListResponseItem(
      divisionName: map['divisionName'] ?? '',
      clockInDate: map['clockInDate'] ?? '',
      clockType: map['clockType'] ?? '',
      lateFlag: map['lateFlag'] ?? false,
    );
  }
}
