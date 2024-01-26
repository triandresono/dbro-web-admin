class DivisionDropdownResponse {
  final List<DivisionDropdownResponseItem> list;

  DivisionDropdownResponse({this.list = const []});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list': list.map((x) => x.toMap()).toList(),
    };
  }

  factory DivisionDropdownResponse.fromMap(Map<String, dynamic> map) {
    return DivisionDropdownResponse(
      list: map['list'] != null
          ? List<DivisionDropdownResponseItem>.from(
              (map['list']).map<DivisionDropdownResponseItem>(
                (x) => DivisionDropdownResponseItem.fromMap(x),
              ),
            )
          : [],
    );
  }
}

class DivisionDropdownResponseItem {
  final String id;
  final String name;

  DivisionDropdownResponseItem({
    this.id = '',
    this.name = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory DivisionDropdownResponseItem.fromMap(Map<String, dynamic> map) {
    return DivisionDropdownResponseItem(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
    );
  }
}
