import 'package:buy_metal_app/domain/repository/application_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:buy_metal_app/domain/router/route_constants.dart';
import 'package:buy_metal_app/domain/router/route_impl.dart';
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
            dialogTittle: 'Ошибка',
            dialogText: 'Не удалось создать заявку \nПроверьте поля заявки',
          ).showMyDialog(context);
        }
        if (state is CreateOrderAllowedToPush) {
          // ТУТ КОРОЧЕЕ ПЕРЕХОД ДЕЛАЕМ
          //Navigator.pushReplacementNamed(context, '/success_order_page');
          context.read<RouteImpl>().go(CreateOrderRoutes.successOrder.name);
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                      isErrorState: state.pageState.sizeRolledError,
                      errorText: state.pageState.errorText,
                      //isValidation: true,
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
                      isErrorState: state.pageState.brandMaterialError,
                      errorText: state.pageState.errorText,
                      //isValidation: true,
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
                            /* if (_sizeRolledTextController.text == '') {
                              const ErrorDialog(
                                dialogTittle: 'Отсутствует размер проката',
                                dialogText: 'Вы не указали размер проката. \nПожалуйста, укажите размер проката',
                              ).showMyDialog(context);
                            } else if (_brandMaterialTextController.text == '') {
                              const ErrorDialog(
                                dialogTittle: 'Отсутствует марка материала',
                                dialogText: 'Вы не указали марку материала. \nПожалуйста, укажите марку материала',
                              ).showMyDialog(context);
                            } else {
                              context.read<CreateOrderBloc>().add(CreateOrderSend());
                            } */
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
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
  }
}

class ParamsFieldWidget extends StatefulWidget {
  const ParamsFieldWidget({
    super.key,
    required this.controller,
    required this.title,
    required this.inputType,
    required this.onChanged,
    //this.isValidation = false,
    this.errorText,
    this.isErrorState = false,
  });
  final TextEditingController controller;
  final String title;
  final TextInputType inputType;
  final Function(String) onChanged;
  //final bool isValidation;
  final String? errorText;
  final bool isErrorState;

  @override
  State<ParamsFieldWidget> createState() => _ParamsFieldWidgetState();
}

class _ParamsFieldWidgetState extends State<ParamsFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      //padding: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.only(bottom: 0),

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
          TextFormField(
            //widget.isValidation
            /* validator: (val) {
              if (widget.isValidation) {
                if (val == null || val.isEmpty) {
                  return 'TextField is empty';
                }
                return null;
              }
              return null;
            }, */
            onChanged: widget.onChanged,
            controller: widget.controller,
            decoration: InputDecoration(
                //errorText: widget.isValidation ? validateTextField(widget.controller.text) : null,
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
          widget.errorText != null && widget.isErrorState
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration:
                        const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      widget.errorText ?? '',
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.red),
                    ),
                  ),
                )
              : const SizedBox(
                  height: 20,
                ),
        ],
      ),
    );
  }
}

/* String validateTextField(String value) {
  if (value.isEmpty) {
    return 'Внесите обязательные данные';
  }
  return '';
} */

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
