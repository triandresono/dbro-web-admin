class PayrollUserList {
  final List<PayrollUserListItem> divisionUserPayrollListingDTOs;
  final String divisionName;

  PayrollUserList({
    this.divisionUserPayrollListingDTOs = const [],
    this.divisionName = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'divisionUserPayrollListingDTOs':
          divisionUserPayrollListingDTOs.map((x) => x.toMap()).toList(),
      'divisionName': divisionName,
    };
  }

  factory PayrollUserList.fromMap(Map<String, dynamic> map) {
    return PayrollUserList(
      divisionName: map['divisionName'] ?? '',
      divisionUserPayrollListingDTOs:
          map['divisionUserPayrollListingDTOs'] != null
              ? List<PayrollUserListItem>.from(
                  (map['divisionUserPayrollListingDTOs'] as List)
                      .map<PayrollUserListItem>(
                    (x) => PayrollUserListItem.fromMap(x),
                  ),
                )
              : [],
    );
  }

  factory PayrollUserList.dummy() {
    return PayrollUserList(
      divisionName: '-',
      divisionUserPayrollListingDTOs: List.generate(5, (index) {
        return PayrollUserListItem(
          joinDate: '=',
          userName: '-',
          gajiPokok: 0,
          potonganLainLain: 0,
          uangMakan: 0,
        );
      }),
    );
  }
}

class PayrollUserListItem {
  final String userAuthId;
  final String userName;
  final String joinDate;
  final num gajiPokok;
  final num uangMakan;
  final num potonganLainLain;

  PayrollUserListItem({
    this.userAuthId = '',
    this.userName = '',
    this.joinDate = '',
    this.gajiPokok = 0,
    this.uangMakan = 0,
    this.potonganLainLain = 0,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userAuthId': userAuthId,
      'userName': userName,
      'joinDate': joinDate,
      'gajiPokok': gajiPokok,
      'uangMakan': uangMakan,
      'potonganLainLain': potonganLainLain,
    };
  }

  factory PayrollUserListItem.fromMap(Map<String, dynamic> map) {
    return PayrollUserListItem(
      userAuthId: map['userAuthId'] ?? '',
      userName: map['userName'] ?? '',
      joinDate: map['joinDate'] ?? '',
      gajiPokok: map['gajiPokok'] ?? 0,
      uangMakan: map['uangMakan'] ?? 0,
      potonganLainLain: map['potonganLainLain'] ?? 0,
    );
  }
}
