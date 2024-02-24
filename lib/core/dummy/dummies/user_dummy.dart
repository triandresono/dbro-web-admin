part of '../dummy.dart';

class _User {
  const _User();

  Either<StatusResponse, Map<String, dynamic>> get login {
    return const Right({
      "token": "kjsaghdhjasgdhjasgdhjagdjhagdahjsg",
    });
  }

  Either<StatusResponse, Map<String, dynamic>> get dropdown {
    return Right({
      "list": List.generate(12, (index) {
        final faker = Faker();
        const id = Uuid();
        return {
          "id": id.v4(),
          "name": faker.person.name(),
        };
      }).toList(),
    });
  }
}
