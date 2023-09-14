import 'package:buy_metal_app/domain/repository/application_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:buy_metal_app/features/1.7/bloc/create_order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CreateOrderPage extends StatefulWidget {
  const CreateOrderPage({super.key});

  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

enum TypeListEnum {
  STRIP,
  CIRCLE,
  SQUARE,
  WIRE,
  HEXAGON,
  CHANNEL,
  I_BEAM,
  CORNER,
  PIPE,
  SHEET,
  ARMATURE,
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  final List<String> typeList = [
    'Полоса',
    'Круг',
    'Квадрат',
    'Проволока',
    'Шестигранник',
    'Швеллер',
    'Двутавр',
    'Уголок',
    'Труба',
    'Лист',
    'Арматура'
  ];
  final List<String> typeListEnum = [
    'STRIP',
    'CIRCLE',
    'SQUARE',
    'WIRE',
    'HEXAGON',
    'CHANNEL',
    'I_BEAM',
    'CORNER',
    'PIPE',
    'SHEET',
    'ARMATURE'
  ];

  late String dropdownValue;
  bool isChoosedForm = false;
  //final TextEditingController testController = TextEditingController();
  // final TextEditingController _formRolledTextController =
  //     TextEditingController();
  final TextEditingController _typeTextController = TextEditingController();
  final TextEditingController _sizeRolledTextController = TextEditingController();
  final TextEditingController _paramsRolledTextController = TextEditingController();
  final TextEditingController _gostRolledTextController = TextEditingController();
  final TextEditingController _brandMaterialTextController = TextEditingController();
  final TextEditingController _paramsMaterialTextController = TextEditingController();
  final TextEditingController _gostMaterialTextController = TextEditingController();
  final TextEditingController _requirementTextController = TextEditingController();
  //final TextEditingController dataCreateTextController = TextEditingController();
  //final TextEditingController idTextController = TextEditingController();

  // final CollectionReference _orders = FirebaseFirestore.instance.collection('orders');

  @override
  void initState() {
    dropdownValue = typeList.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /* // доделать
    bool isChoosedForm = false;
    //const String noneChoosedForm = 'Полоса';
    if (isChoosedForm == false) {
      const String defaultChoosedForm = 'Полоса';
      context.read<CreateOrderBloc>().add(CreateOrderInputRolledForm(defaultChoosedForm));
    } */
    return BlocProvider(
      create: (context) => CreateOrderBloc(
          applicationRepository: context.read<GetIt>().get<ApplicationRepository>(),
          userRepository: context.read<GetIt>().get<UserRepository>(),
          pageState: const PageState()),
      child: BlocConsumer<CreateOrderBloc, CreateOrderState>(listener: (context, state) {
        if (state is CreateOrderError) {
          const ErrorDialog(
            dialogTittle: 'Ошибка запроса',
            dialogText: 'Не удалось создать заявку, простите =(',
          ).showMyDialog(context);
        }
        if (state is CreateOrderAllowedToPush) {
          // ТУТ КОРОЧЕЕ ПЕРЕХОД ДЕЛАЕМ
          Navigator.pushReplacementNamed(context, '/success_order_page');
        }
      }, builder: (context, state) {
        late TypeListEnum formChoosed;

        //const String noneChoosedForm = 'Полоса';
        if (isChoosedForm == false) {
          //const String defaultChoosedForm = 'Полоса';
          TypeListEnum formChoosed = TypeListEnum.STRIP;
          context.read<CreateOrderBloc>().add(CreateOrderInputRolledForm(formChoosed));
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: const Text('Создание заявки'),
            centerTitle: true,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Выберите форму проката *', //обязательное поле
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: DropdownButton(
                            value: dropdownValue,
                            items: typeList.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? val) {
                              setState(() {
                                //context.read<CreateOrderBloc>().add(CreateOrderInputRolledForm(formChoosed));
                                //TypeListEnum formChoosed;
                                //TypeListEnum.STRIP;
                                if (val == typeList[0]) {
                                  formChoosed = TypeListEnum.STRIP;
                                } else if (val == typeList[1]) {
                                  formChoosed = TypeListEnum.CIRCLE;
                                } else if (val == typeList[2]) {
                                  formChoosed = TypeListEnum.SQUARE;
                                } else if (val == typeList[3]) {
                                  formChoosed = TypeListEnum.WIRE;
                                } else if (val == typeList[4]) {
                                  formChoosed = TypeListEnum.HEXAGON;
                                } else if (val == typeList[5]) {
                                  formChoosed = TypeListEnum.CHANNEL;
                                } else if (val == typeList[6]) {
                                  formChoosed = TypeListEnum.I_BEAM;
                                } else if (val == typeList[7]) {
                                  formChoosed = TypeListEnum.CORNER;
                                } else if (val == typeList[8]) {
                                  formChoosed = TypeListEnum.PIPE;
                                } else if (val == typeList[9]) {
                                  formChoosed = TypeListEnum.SHEET;
                                } else if (val == typeList[10]) {
                                  formChoosed = TypeListEnum.ARMATURE;
                                }

                                //formChoosed = val ?? 'Полоса';
                                dropdownValue = val ?? 'Полоса';
                                isChoosedForm = true;
                                //String enumType =
                                context.read<CreateOrderBloc>().add(CreateOrderInputRolledForm(formChoosed));
                              });
                            }),
                      ),
                    ),
                    const Text(
                      '* на каждую форму проката должна формироваться новая заявка',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ParamsFieldWidget(
                      title: 'Классификация/тип профиля',
                      controller: _typeTextController,
                      inputType: TextInputType.text,
                      onChanged: (value) => context.read<CreateOrderBloc>().add(CreateOrderInputRolledType(value)),
                    ),
                    ParamsFieldWidget(
                      title: 'Размер проката, мм *', //обязательное поле
                      controller: _sizeRolledTextController,
                      inputType: TextInputType.text,
                      onChanged: (value) => context.read<CreateOrderBloc>().add(CreateOrderInputRolledSize(value)),
                    ),
                    ParamsFieldWidget(
                      title: 'Параметры проката',
                      controller: _paramsRolledTextController,
                      inputType: TextInputType.text,
                      onChanged: (value) => context.read<CreateOrderBloc>().add(CreateOrderInputRolledParams(value)),
                    ),
                    ParamsFieldWidget(
                      title: 'ГОСТ на прокат',
                      controller: _gostRolledTextController,
                      inputType: TextInputType.text,
                      onChanged: (value) => context.read<CreateOrderBloc>().add(CreateOrderInputRolledGost(value)),
                    ),
                    ParamsFieldWidget(
                      title: 'Марка материала *', //обязательное
                      controller: _brandMaterialTextController,
                      inputType: TextInputType.text,
                      onChanged: (value) => context.read<CreateOrderBloc>().add(CreateOrderInputMaterialBrand(value)),
                    ),
                    ParamsFieldWidget(
                      title: 'Параметры материала',
                      controller: _paramsMaterialTextController,
                      inputType: TextInputType.text,
                      onChanged: (value) => context.read<CreateOrderBloc>().add(CreateOrderInputMaterialParams(value)),
                    ),
                    ParamsFieldWidget(
                      title: 'ГОСТ на материал',
                      controller: _gostMaterialTextController,
                      inputType: TextInputType.text,
                      onChanged: (value) => context.read<CreateOrderBloc>().add(CreateOrderInputMaterialGost(value)),
                    ),
                    ParamsFieldWidget(
                        title: 'Потребность, т',
                        controller: _requirementTextController,
                        inputType: TextInputType.number,
                        onChanged: (value) {
                          double amount = 0;
                          if (value != '') {
                            amount = double.parse(value);
                          }
                          //int amount = int.parse(value);
                          context.read<CreateOrderBloc>().add(CreateOrderInputAmount(amount));
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 65,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<CreateOrderBloc>().add(CreateOrderSend());

                            /* try {
                              context.read<CreateOrderBloc>().add(CreateOrderSend());
                              Navigator.pushReplacementNamed(context, '/success_order_page');
                            } catch (e) {
                              const ErrorDialog(
                                dialogTittle: 'Ошибка запроса',
                                dialogText: 'Не удалось создать заявку, простите =(',
                              ).showMyDialog(context);
                            } */

                            /*
                                String dateCreate =
                                    '${DateTime.now().day.toString().length < 2 ? "0${DateTime.now().day}" : DateTime.now().day}.${DateTime.now().month.toString().length < 2 ? "0${DateTime.now().month}" : DateTime.now().month}.${DateTime.now().year}';
                                await getIt
                                    .get<ProfileRepository>()
                                    .createOrder(
                                        request: OrderModel(
                                      buyerId: getIt.get<ProfileRepository>().user.id,
                                      formRolled: dropdownValue,
                                      type: _typeTextController.text,
                                      sizeRolled: _sizeRolledTextController.text,
                                      paramsRolled: _paramsRolledTextController.text,
                                      gostRolled: _gostRolledTextController.text,
                                      brandMaterial: _brandMaterialTextController.text,
                                      paramsMaterial: _paramsMaterialTextController.text,
                                      gostMaterial: _gostMaterialTextController.text,
                                      requirement: double.parse(_requirementTextController.text),
                                      dataCreate: dateCreate,
                                    ))
                                    */

                            //.whenComplete(() => Navigator.pushReplacementNamed(context, '/success_order_page'));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          ),
                          child: const Text(
                            'Разместить заявку',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
/*
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Создание заявки'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Выберите форму проката *', //обязательное поле
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: DropdownButton(
                        value: dropdownValue,
                        items: typeList.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? val) {
                          setState(() {
                            dropdownValue = val ?? '';
                          });
                        }),
                  ),
                ),
                const Text(
                  '* на каждую форму проката должна формироваться новая заявка',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                const SizedBox(
                  height: 20,
                ),
                ParamsFieldWidget(
                  title: 'Классификация/тип профиля',
                  controller: _typeTextController,
                  inputType: TextInputType.text,
                ),
                ParamsFieldWidget(
                  title: 'Размер проката, мм *', //обязательное поле
                  controller: _sizeRolledTextController,
                  inputType: TextInputType.text,
                ),
                ParamsFieldWidget(
                  title: 'Параметры проката',
                  controller: _paramsRolledTextController,
                  inputType: TextInputType.text,
                ),
                ParamsFieldWidget(
                  title: 'ГОСТ на прокат',
                  controller: _gostRolledTextController,
                  inputType: TextInputType.text,
                ),
                ParamsFieldWidget(
                  title: 'Марка материала *', //обязательное
                  controller: _brandMaterialTextController,
                  inputType: TextInputType.text,
                ),
                ParamsFieldWidget(
                  title: 'Параметры материала',
                  controller: _paramsMaterialTextController,
                  inputType: TextInputType.text,
                ),
                ParamsFieldWidget(
                  title: 'ГОСТ на материал',
                  controller: _gostMaterialTextController,
                  inputType: TextInputType.text,
                ),
                ParamsFieldWidget(
                  title: 'Потребность, т',
                  controller: _requirementTextController,
                  inputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 65,
                    child: ElevatedButton(
                      onPressed: () async {
                        String dateCreate =
                            '${DateTime.now().day.toString().length < 2 ? "0${DateTime.now().day}" : DateTime.now().day}.${DateTime.now().month.toString().length < 2 ? "0${DateTime.now().month}" : DateTime.now().month}.${DateTime.now().year}';
                        await getIt
                            .get<ProfileRepository>()
                            .createOrder(
                                request: OrderModel(
                              buyerId: getIt.get<ProfileRepository>().user.id,
                              formRolled: dropdownValue,
                              type: _typeTextController.text,
                              sizeRolled: _sizeRolledTextController.text,
                              paramsRolled: _paramsRolledTextController.text,
                              gostRolled: _gostRolledTextController.text,
                              brandMaterial: _brandMaterialTextController.text,
                              paramsMaterial: _paramsMaterialTextController.text,
                              gostMaterial: _gostMaterialTextController.text,
                              requirement: double.parse(_requirementTextController.text),
                              dataCreate: dateCreate,
                            ))
                            .whenComplete(() =>
                                Navigator.pushReplacementNamed(context, '/success_order_page'));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                      child: const Text(
                        'Разместить заявку',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  */
  }
}

class ParamsFieldWidget extends StatefulWidget {
  const ParamsFieldWidget({
    super.key,
    required this.controller,
    required this.title,
    required this.inputType,
    required this.onChanged,
  });
  final TextEditingController controller;
  final String title;
  final TextInputType inputType;
  final Function(String) onChanged;

  @override
  State<ParamsFieldWidget> createState() => _ParamsFieldWidgetState();
}

class _ParamsFieldWidgetState extends State<ParamsFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: widget.onChanged,
            controller: widget.controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(15))),
            keyboardType: widget.inputType,
          ),
        ],
      ),
    );
  }
}

class ErrorDialog {
  const ErrorDialog({required this.dialogTittle, required this.dialogText});

  final String dialogTittle;
  final String dialogText;

  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(dialogTittle),
          //const Text('Пароли не совпадают'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(dialogText),
                //Text('Убедитесь, что вы ввели идентичные пароли, попробуйте повторить пароль еще раз'),
                //Text('Проверьте, чтобы пароли совпадали'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

/* String getEnumName(val) {
  String dropdownValue;


  if (val == typeList[0]) {
    dropdownValue = typeListEnum[0];
  } else if (val == typeList[1]) {
    dropdownValue = typeListEnum[1];
  } else if (val == typeList[2]) {
    dropdownValue = typeListEnum[2];
  } else if (val == typeList[3]) {
    dropdownValue = typeListEnum[3];
  } else if (val == typeList[4]) {
    dropdownValue = typeListEnum[4];
  } else if (val == typeList[5]) {
    dropdownValue = typeListEnum[5];
  } else if (val == typeList[6]) {
    dropdownValue = typeListEnum[6];
  } else if (val == typeList[7]) {
    dropdownValue = typeListEnum[7];
  } else if (val == typeList[8]) {
    dropdownValue = typeListEnum[8];
  } else if (val == typeList[9]) {
    dropdownValue = typeListEnum[9];
  }

  return dropdownValue;

} */
