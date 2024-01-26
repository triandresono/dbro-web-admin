part of '../dummy.dart';

class _Division {
  const _Division();

  Either<Status, Map<String, dynamic>> get root {
    return Right(
      {
        "totalCount": 5,
        "divisionDTOs": List.generate(5, (index) {
          final faker = Faker();
          const id = Uuid();
          return {
            "id": id.v4(),
            "name": faker.company.position(),
            "createdDate": DateFormat('dd-MM-yyyy').format(
              faker.date.dateTime(),
            ),
            "createdBy": faker.person.name(),
          };
        }).toList(),
      },
    );
  }

  Either<Status, Map<String, dynamic>> get dropdown {
    return Right({
      "list": List.generate(12, (index) {
        final faker = Faker();
        const id = Uuid();
        return {
          "id": id.v4(),
          "name": faker.company.position(),
        };
      }).toList(),
    });
  }

  Either<Status, Map<String, dynamic>> get user {
    return Right({
      "list": List.generate(12, (index) {
        final faker = Faker();
        const id = Uuid();
        return {
          "id": id.v4(),
          "name": faker.person.name(),
          "createdDate": DateFormat('dd-MM-yyyy').format(
            faker.date.dateTime(),
          ),
          "createdBy": faker.person.name(),
        };
      }).toList(),
    });
  }

  Either<Status, Map<String, dynamic>> get id {
    const id = Uuid();
    return Right({
      "id": id.v4(),
    });
  }
}
