class OutletPayrollList {
  final List<OutletPayrollListItem> divisionPayrollListingDTOs;

  OutletPayrollList({
    this.divisionPayrollListingDTOs = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'divisionPayrollListingDTOs':
          divisionPayrollListingDTOs.map((x) => x.toMap()).toList(),
    };
  }

  factory OutletPayrollList.fromMap(Map<String, dynamic> map) {
    return OutletPayrollList(
      divisionPayrollListingDTOs: map['divisionPayrollListingDTOs'] != null
          ? List<OutletPayrollListItem>.from(
              (map['divisionPayrollListingDTOs'] as List)
                  .map<OutletPayrollListItem>(
                (x) => OutletPayrollListItem.fromMap(x),
              ),
            )
          : [],
    );
  }

  factory OutletPayrollList.dummy() {
    return OutletPayrollList(
      divisionPayrollListingDTOs: List.generate(5, (index) {
        return OutletPayrollListItem(
          name: "-",
          createdBy: '-',
          createdDate: '-',
          jumlahBonusHarian: 0,
          jumlahBonusKawaka: 0,
        );
      }),
    );
  }
}

class OutletPayrollListItem {
  final String id;
  final String name;
  final String createdBy;
  final String createdDate;
  final String lastModifiedBy;
  final String lastModifiedDate;
  final num jumlahBonusHarian;
  final num jumlahBonusKawaka;

  OutletPayrollListItem({
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

  factory OutletPayrollListItem.fromMap(Map<String, dynamic> map) {
    return OutletPayrollListItem(
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
