class OutletPayrollListResponse {
  final List<OutletPayrollListResponseItem> divisionPayrollListingDTOs;

  OutletPayrollListResponse({
    this.divisionPayrollListingDTOs = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'divisionPayrollListingDTOs':
          divisionPayrollListingDTOs.map((x) => x.toMap()).toList(),
    };
  }

  factory OutletPayrollListResponse.fromMap(Map<String, dynamic> map) {
    return OutletPayrollListResponse(
      divisionPayrollListingDTOs: map['divisionPayrollListingDTOs'] != null
          ? List<OutletPayrollListResponseItem>.from(
              (map['divisionPayrollListingDTOs'] as List)
                  .map<OutletPayrollListResponseItem>(
                (x) => OutletPayrollListResponseItem.fromMap(x),
              ),
            )
          : [],
    );
  }
}

class OutletPayrollListResponseItem {
  final String id;
  final String name;
  final String createdBy;
  final String createdDate;
  final String lastModifiedBy;
  final String lastModifiedDate;
  final num jumlahBonusHarian;
  final num jumlahBonusKawaka;

  OutletPayrollListResponseItem({
    this.id = '',
    this.name = '',
    this.createdBy = '',
    this.createdDate = '',
    this.lastModifiedBy = '',
    this.lastModifiedDate = '',
    this.jumlahBonusHarian = 0,
    this.jumlahBonusKawaka = 0,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'createdBy': createdBy,
      'createdDate': createdDate,
      'lastModifiedBy': lastModifiedBy,
      'lastModifiedDate': lastModifiedDate,
      'jumlahBonusHarian': jumlahBonusHarian,
      'jumlahBonusKawaka': jumlahBonusKawaka,
    };
  }

  factory OutletPayrollListResponseItem.fromMap(Map<String, dynamic> map) {
    return OutletPayrollListResponseItem(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      createdBy: map['createdBy'] ?? '',
      createdDate: map['createdDate'] ?? '',
      lastModifiedBy: map['lastModifiedBy'] ?? '',
      lastModifiedDate: map['lastModifiedDate'] ?? '',
      jumlahBonusHarian: map['jumlahBonusHarian'] ?? 0,
      jumlahBonusKawaka: map['jumlahBonusKawaka'] ?? 0,
    );
  }
}
