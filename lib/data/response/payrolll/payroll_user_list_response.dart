class PayrollUserListResponse {
  final List<PayrollUserListResponseItem> divisionUserPayrollListingDTOs;
  final String divisionName;

  PayrollUserListResponse({
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

  factory PayrollUserListResponse.fromMap(Map<String, dynamic> map) {
    return PayrollUserListResponse(
      divisionName: map['divisionName'] ?? '',
      divisionUserPayrollListingDTOs:
          map['divisionUserPayrollListingDTOs'] != null
              ? List<PayrollUserListResponseItem>.from(
                  (map['divisionUserPayrollListingDTOs'] as List)
                      .map<PayrollUserListResponseItem>(
                    (x) => PayrollUserListResponseItem.fromMap(x),
                  ),
                )
              : [],
    );
  }
}

class PayrollUserListResponseItem {
  final String userAuthId;
  final String userName;
  final String joinDate;
  final num gajiPokok;
  final num uangMakan;
  final num potonganLainLain;

  PayrollUserListResponseItem({
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

  factory PayrollUserListResponseItem.fromMap(Map<String, dynamic> map) {
    return PayrollUserListResponseItem(
      userAuthId: map['userAuthId'] ?? '',
      userName: map['userName'] ?? '',
      joinDate: map['joinDate'] ?? '',
      gajiPokok: map['gajiPokok'] ?? 0,
      uangMakan: map['uangMakan'] ?? 0,
      potonganLainLain: map['potonganLainLain'] ?? 0,
    );
  }
}
