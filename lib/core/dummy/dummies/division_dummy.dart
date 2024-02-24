part of '../dummy.dart';

class _Division {
  const _Division();

  Either<StatusResponse, Map<String, dynamic>> get root {
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

  Either<StatusResponse, Map<String, dynamic>> get dropdown {
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

  Either<StatusResponse, Map<String, dynamic>> get user {
    return Right({
      "userListingDTOs": List.generate(12, (index) {
        final faker = Faker();
        const id = Uuid();
        return {
          "id": id.v4(),
          "name": faker.person.name(),
          "email": "${faker.person.name().toLowerCase()}@gmail.com",
          "role": faker.company.position(),
          "createdBy": faker.person.name(),
          "createdDate": DateFormat('dd-MM-yyyy').format(
            faker.date.dateTime(),
          ),
        };
      }).toList(),
    });
  }

  Either<StatusResponse, Map<String, dynamic>> get id {
    const id = Uuid();
    return Right({
      "id": id.v4(),
    });
  }
}
