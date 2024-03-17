part of 'add_user_worker.dart';

@RoutePage()
class AddUserPage extends StatelessWidget {
  static const path = 'user/add_user';
  const AddUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Util.drawer(context),
      backgroundColor: AppColor.appGrayBg,
      appBar: BaseAppbar(
        title: 'User',
        menu: [
          Bar(
            title: 'Manage User',
            color: AppColor.projectPrimary,
            onTap: () => AppRouter.nav.replace(const UserListRoute()),
          ),
          Bar(
            title: 'Add User',
            color: AppColor.projectPrimary,
          ),
        ],
      ),
      body: GetBuilder(
        init: AddUserBloc(
          registerUserUsecase: Get.find(),
        ),
        builder: (_) {
          return _State();
        },
      ),
    );
  }
}

class _State extends GetState<AddUserBloc> with _Worker {
  @override
  void registerStateEffect(BuildContext currentContext) {
    (this).disposables.addAll(worker);
    super.registerStateEffect(currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return GetStateBuilder<AddUserBloc>(
      container: this,
      context: context,
      init: bloc,
      builder: (_) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
            bottom: 24,
          ),
          child: BaseContainer(
            child: Form(
              key: bloc.formKey,
              onChanged: () {
                final valid = bloc.formKey.currentState?.validate() ?? false;
                bloc.valid(valid);
              },
              child: _Body(bloc: bloc),
            ),
          ),
        );
      },
    );
  }
}

class _Body extends StatelessWidget {
  final AddUserBloc bloc;
  const _Body({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return AnimatedColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personal Info',
          style: Font.fix(18).bold(
            color: AppColor.headerTile,
          ),
        ),
        const SizedBox(height: 15),
        CommonFlexChildren(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonFlex(
              child: PrefixBaseInput(
                labelBgColor: Colors.white,
                controller: bloc.nameCo,
                hint: 'Name',
                validator: (value) {
                  final str = value ?? '';
                  if (str.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const CommonFlexBox(size: 20),
            CommonFlex(
              child: PrefixBaseInput(
                labelBgColor: Colors.white,
                controller: bloc.emailCo,
                inputType: TextInputType.emailAddress,
                hint: 'Email',
                validator: (value) {
                  final str = value ?? '';
                  if (str.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        CommonFlexChildren(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonFlex(
              child: PrefixBaseInput(
                labelBgColor: Colors.white,
                controller: bloc.birthPlaceCo,
                hint: 'Birth Place',
                validator: (value) {
                  final str = value ?? '';
                  if (str.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const CommonFlexBox(size: 20),
            CommonFlex(
              child: PrefixBaseInput(
                labelBgColor: Colors.white,
                controller: bloc.birthDateCo,
                inputType: TextInputType.emailAddress,
                hint: 'Birth Date',
                readonly: true,
                trailing: (color) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(
                      IconlyLight.calendar,
                      color: color,
                    ),
                  );
                },
                onTap: () async {
                  final date = await context.datePicker();
                  if (date != null) {
                    var res = DateFormat("MM/dd/yyyy").format(date);
                    bloc.birthDateCo.text = res;
                  }
                },
                validator: (value) {
                  final str = value ?? '';
                  if (str.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        CommonFlexChildren(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonFlex(
              child: PrefixBaseInput(
                labelBgColor: Colors.white,
                controller: bloc.phoneCo,
                hint: 'Phone',
                validator: (value) {
                  final str = value ?? '';
                  if (str.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const CommonFleWidth(size: 20),
            const CommonFlex(child: SizedBox()),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'Work Info',
          style: Font.fix(18).bold(
            color: AppColor.headerTile,
          ),
        ),
        const SizedBox(height: 15),
        CommonFlexChildren(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonFlex(
              child: PrefixBaseInput(
                labelBgColor: Colors.white,
                controller: bloc.roleCo,
                hint: 'Role',
                readonly: true,
                trailing: (color) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12, bottom: 5),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                        color: color,
                      ),
                    ),
                  );
                },
                onTap: () async {
                  final result = await AppRouter.nav.dialog(
                    dialog: RoleDropdownDialog(
                      argument: RoleDropdownDialogArgument(
                        title: "Choose Role",
                        selected: bloc.roleVal,
                      ),
                    ),
                  );
                  if (result != null && result is RoleDropdownItem) {
                    bloc.roleCo.text = result.name;
                    bloc.roleVal = result;
                  }
                },
                validator: (value) {
                  final str = value ?? '';
                  if (str.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const CommonFlexBox(size: 20),
            CommonFlex(
              child: PrefixBaseInput(
                labelBgColor: Colors.white,
                controller: bloc.joinDateCo,
                hint: 'Join Date',
                readonly: true,
                trailing: (color) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(
                      IconlyLight.calendar,
                      color: color,
                    ),
                  );
                },
                onTap: () async {
                  final date = await context.datePicker();
                  if (date != null) {
                    var res = DateFormat("MM/dd/yyyy").format(date);
                    bloc.joinDateCo.text = res;
                  }
                },
                validator: (value) {
                  final str = value ?? '';
                  if (str.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        CommonFlexChildren(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonFlex(
              child: PrefixBaseInput(
                labelBgColor: Colors.white,
                controller: bloc.npwpCo,
                hint: 'NPWP',
                validator: (value) {
                  final str = value ?? '';
                  if (str.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const CommonFlexBox(size: 20),
            CommonFlex(
              child: PrefixBaseInput(
                labelBgColor: Colors.white,
                controller: bloc.bpjsCo,
                hint: 'BPJS',
                validator: (value) {
                  final str = value ?? '';
                  if (str.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        CommonFlexChildren(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonFlex(
              child: PrefixBaseInput(
                labelBgColor: Colors.white,
                controller: bloc.bsiAccountCo,
                hint: 'BSI Account',
                validator: (value) {
                  final str = value ?? '';
                  if (str.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const CommonFleWidth(size: 20),
            const CommonFlex(child: SizedBox()),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'Identity Info',
          style: Font.fix(18).bold(
            color: AppColor.headerTile,
          ),
        ),
        const SizedBox(height: 15),
        CommonFlexChildren(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonFlex(
              child: PrefixBaseInput(
                labelBgColor: Colors.white,
                controller: bloc.ktpCo,
                hint: 'KTP',
                validator: (value) {
                  final str = value ?? '';
                  if (str.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const CommonFlexBox(size: 20),
            CommonFlex(
              child: PrefixBaseInput(
                labelBgColor: Colors.white,
                controller: bloc.genderCo,
                hint: 'Gender',
                readonly: true,
                trailing: (color) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12, bottom: 5),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                        color: color,
                      ),
                    ),
                  );
                },
                onTap: () async {
                  final result = await AppRouter.nav.dialog(
                    dialog: SysconfigDialog(
                      argument: SysconfigDialogArgument(
                        title: "Select Gender",
                        selected: bloc.genderVal,
                        type: "GENDER",
                      ),
                    ),
                  );
                  if (result != null && result is SysconfigListItem) {
                    bloc.genderCo.text = result.value;
                    bloc.genderVal = result;
                  }
                },
                validator: (value) {
                  final str = value ?? '';
                  if (str.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        CommonFlexChildren(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonFlex(
              child: PrefixBaseInput(
                labelBgColor: Colors.white,
                controller: bloc.employmentCo,
                hint: 'Employment Status',
                readonly: true,
                trailing: (color) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12, bottom: 5),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                        color: color,
                      ),
                    ),
                  );
                },
                onTap: () async {
                  final result = await AppRouter.nav.dialog(
                    dialog: SysconfigDialog(
                      argument: SysconfigDialogArgument(
                        title: "Select Employment Status",
                        selected: bloc.employmentVal,
                        type: "EMPLOYMENT_STATUS",
                      ),
                    ),
                  );
                  if (result != null && result is SysconfigListItem) {
                    bloc.employmentCo.text = result.value;
                    bloc.employmentVal = result;
                  }
                },
                validator: (value) {
                  final str = value ?? '';
                  if (str.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const CommonFlexBox(size: 20),
            CommonFlex(
              child: PrefixBaseInput(
                labelBgColor: Colors.white,
                controller: bloc.maritalCo,
                hint: 'Marital Status',
                readonly: true,
                trailing: (color) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12, bottom: 5),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                        color: color,
                      ),
                    ),
                  );
                },
                onTap: () async {
                  final result = await AppRouter.nav.dialog(
                    dialog: SysconfigDialog(
                      argument: SysconfigDialogArgument(
                        title: "Select Marital Status",
                        selected: bloc.maritalStatusVal,
                        type: "MARRITAL_STATUS",
                      ),
                    ),
                  );
                  if (result != null && result is SysconfigListItem) {
                    bloc.maritalCo.text = result.value;
                    bloc.maritalStatusVal = result;
                  }
                },
                validator: (value) {
                  final str = value ?? '';
                  if (str.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        CommonFlexChildren(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonFlex(
              child: PrefixBaseInput(
                labelBgColor: Colors.white,
                controller: bloc.educationCo,
                hint: 'Last Education',
                readonly: true,
                trailing: (color) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12, bottom: 5),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                        color: color,
                      ),
                    ),
                  );
                },
                onTap: () async {
                  final result = await AppRouter.nav.dialog(
                    dialog: SysconfigDialog(
                      argument: SysconfigDialogArgument(
                        title: "Select Last Education",
                        selected: bloc.educationVal,
                        type: "EDUCATION",
                      ),
                    ),
                  );
                  if (result != null && result is SysconfigListItem) {
                    bloc.educationCo.text = result.value;
                    bloc.educationVal = result;
                  }
                },
                validator: (value) {
                  final str = value ?? '';
                  if (str.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const CommonFlexBox(size: 20),
            CommonFlex(
              child: PrefixBaseInput(
                labelBgColor: Colors.white,
                controller: bloc.religionCo,
                hint: 'Religion',
                readonly: true,
                trailing: (color) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12, bottom: 5),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                        color: color,
                      ),
                    ),
                  );
                },
                onTap: () async {
                  final result = await AppRouter.nav.dialog(
                    dialog: SysconfigDialog(
                      argument: SysconfigDialogArgument(
                        title: "Select Religion",
                        selected: bloc.religionVal,
                        type: "RELIGION",
                      ),
                    ),
                  );
                  if (result != null && result is SysconfigListItem) {
                    bloc.religionCo.text = result.value;
                    bloc.religionVal = result;
                  }
                },
                validator: (value) {
                  final str = value ?? '';
                  if (str.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        CommonFlexChildren(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonFlex(
              child: PrefixBaseInput(
                labelBgColor: Colors.white,
                controller: bloc.bloodCo,
                hint: 'Blood Type',
                readonly: true,
                trailing: (color) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12, bottom: 5),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                        color: color,
                      ),
                    ),
                  );
                },
                onTap: () async {
                  final result = await AppRouter.nav.dialog(
                    dialog: SysconfigDialog(
                      argument: SysconfigDialogArgument(
                        title: "Select Blood Type",
                        selected: bloc.bloodVal,
                        type: "BLOOD_TYPE",
                      ),
                    ),
                  );
                  if (result != null && result is SysconfigListItem) {
                    bloc.bloodCo.text = result.value;
                    bloc.bloodVal = result;
                  }
                },
                validator: (value) {
                  final str = value ?? '';
                  if (str.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const CommonFleWidth(size: 20),
            const CommonFlex(child: SizedBox()),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'Identity Address',
          style: Font.fix(18).bold(
            color: AppColor.headerTile,
          ),
        ),
        const SizedBox(height: 15),
        CommonFlexChildren(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonFlex(
              child: PrefixBaseInput(
                height: 80,
                labelBgColor: Colors.white,
                controller: bloc.ktpAddressCo,
                textInputAction: TextInputAction.newline,
                inputType: TextInputType.multiline,
                hint: 'KTP Address',
                minLines: 1,
                maxLines: 4,
                validator: (value) {
                  final str = value ?? '';
                  if (str.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const CommonFlexBox(size: 20),
            CommonFlex(
              child: PrefixBaseInput(
                height: 80,
                labelBgColor: Colors.white,
                controller: bloc.domicileAddressCo,
                textInputAction: TextInputAction.newline,
                inputType: TextInputType.multiline,
                minLines: 1,
                maxLines: 4,
                hint: 'Domicile Address',
                validator: (value) {
                  final str = value ?? '';
                  if (str.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 38),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(),
            Obx(() {
              final valid = bloc.valid.value;
              return BaseButtonIcon(
                isFillWidth: false,
                isDisabled: valid == false,
                title: "Submit",
                onPressed: () => bloc.register(),
              );
            }),
          ],
        ),
      ],
    );
  }
}
