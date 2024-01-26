class DivisionDropdown {
  final List<DivisionDropdownItem> list;

  DivisionDropdown({this.list = const []});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list': list.map((x) => x.toMap()).toList(),
    };
  }

  factory DivisionDropdown.fromMap(Map<String, dynamic> map) {
    return DivisionDropdown(
      list: map['list'] != null
          ? List<DivisionDropdownItem>.from(
              (map['list']).map<DivisionDropdownItem>(
                (x) => DivisionDropdownItem.fromMap(x),
              ),
            )
          : [],
    );
  }
}

class DivisionDropdownItem {
  final String id;
  final String name;

  DivisionDropdownItem({
    this.id = '',
    this.name = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory DivisionDropdownItem.fromMap(Map<String, dynamic> map) {
    return DivisionDropdownItem(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
    );
  }
}
