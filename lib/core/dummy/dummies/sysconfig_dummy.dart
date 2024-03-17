part of '../dummy.dart';

class _SysConfig {
  const _SysConfig();

  Either<StatusResponse, Map<String, dynamic>> get sysconfig_list {
    return Right(SysconfigListResponse(
      totalCount: 5,
      dtos: List.generate(5, (index) {
        final faker = Faker();
        const id = Uuid();
        return SysconfigListResponseItem(
          id: id.v4(),
          createdBy: faker.person.name(),
          createdDate: faker.date.dateTime().fromDate(),
          lastModifiedBy: faker.person.name(),
          lastModifiedDate: faker.date.dateTime().fromDate(),
          value: faker.address.city().toUpperCase(),
          key: faker.address.city().toLowerCase(),
        );
      }),
    ).toMap());
  }
}
