import 'package:buy_metal_app/data/models/application_models/application_upload_search_response.dart';
import 'package:buy_metal_app/domain/repository/application_response_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:buy_metal_app/domain/router/route_constants.dart';
import 'package:buy_metal_app/domain/router/route_impl.dart';
import 'package:buy_metal_app/features/2.5/bloc/create_similar_proposal_bloc.dart';
import 'package:buy_metal_app/features/core_widgets/error_dialog_widget.dart';
import 'package:buy_metal_app/features/core_widgets/rolled_form_ru_name_converter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CreateSimilarProposalPage extends StatefulWidget {
  const CreateSimilarProposalPage({super.key, required this.args});
  final Object? args;

  @override
  State<CreateSimilarProposalPage> createState() => _CreateSimilarProposalPageState();
}

class _CreateSimilarProposalPageState extends State<CreateSimilarProposalPage> {
  //late UserModel userModel;
  //late OrderModel orderModel;
  //final TextEditingController testController = TextEditingController();
  int selectedValue = 0;
  final TextEditingController _priceController = TextEditingController();
  double price = 0;

  final String _requirement = '5.4 т';
  //bool _inStock = false;
  //bool _notStock = false;

  final TextEditingController _typeTextController = TextEditingController();
  final TextEditingController _sizeRolledTextController = TextEditingController();
  final TextEditingController _paramsRolledTextController = TextEditingController();
  final TextEditingController _gostRolledTextController = TextEditingController();
  final TextEditingController _brandMaterialTextController = TextEditingController();
  final TextEditingController _paramsMaterialTextController = TextEditingController();
  final TextEditingController _gostMaterialTextController = TextEditingController();
  final TextEditingController _dateTextController = TextEditingController();

  //final CollectionReference _similarProposal = FirebaseFirestore.instance.collection('similar_proposals');
  /*
  @override
  void initState() {
    Map<String, dynamic> map = widget.args != null ? widget.args as Map<String, dynamic> : {};
    orderModel = map['order_model'];
    userModel = map['user_model'];
    super.initState();
  }
  */

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var args = ModalRoute.of(context)!.settings.arguments as ApplicationUploadSearchResponse;
    final args = widget.args as ApplicationUploadSearchResponse;

    return BlocProvider(
      create: (context) => CreateSimilarProposalBloc(
          applicationResponseRepository: context.read<GetIt>().get<ApplicationResponseRepository>(),
          userRepository: context.read<GetIt>().get<UserRepository>(),
          applicationProposalResponse: args,
          pageState: const PageState()),
      child: BlocConsumer<CreateSimilarProposalBloc, CreateSimilarProposalState>(
        listener: (context, state) {
          if (state is CreateSimilarProposalAllowedToPushState) {
            //Navigator.pushReplacementNamed(context, '/success_proposal_page');
            context.read<RouteImpl>().go(FindCustomerRoutes.successProposal.name);
          }
          if (state is CreateSimilarProposalErrorState) {
            ErrorDialog(
              dialogTittle: 'Ошибка',
              dialogText: state.pageState.errMsg,
            ).showMyDialog(context);
          }
        },
        builder: (context, state) {
          //final TextEditingController _priceController = TextEditingController();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black87,
              title: const Text('Описание предложения'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        '${args.customer.companyName} ${args.customer.companyAddress}',
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    Center(
                      child: Text(
                        'от ${args.creationDate}',
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text(
                          'Форма проката:',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          rolledFormRuNameConverter(args.rolledForm),
                          style: const TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '* поля обязательные для заполнения',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                    const SizedBox(height: 10),
                    ParamsFieldWidget(
                      title: 'Классификация/тип профиля *',
                      controller: _typeTextController,
                      inputType: TextInputType.text,
                      onChanged: (value) => context
                          .read<CreateSimilarProposalBloc>()
                          .add(CreateSimilarProposalInputRolledTypeEvent(value)),
                    ),
                    ParamsFieldWidget(
                      title: 'Размер проката, мм *', //обязательное поле
                      controller: _sizeRolledTextController,
                      inputType: TextInputType.text,
                      onChanged: (value) => context
                          .read<CreateSimilarProposalBloc>()
                          .add(CreateSimilarProposalInputRolledSizeEvent(value)),
                    ),
                    ParamsFieldWidget(
                      title: 'Параметры проката *',
                      controller: _paramsRolledTextController,
                      inputType: TextInputType.text,
                      onChanged: (value) => context
                          .read<CreateSimilarProposalBloc>()
                          .add(CreateSimilarProposalInputRolledParamsEvent(value)),
                    ),
                    ParamsFieldWidget(
                      title: 'ГОСТ на прокат',
                      controller: _gostRolledTextController,
                      inputType: TextInputType.text,
                      onChanged: (value) => context
                          .read<CreateSimilarProposalBloc>()
                          .add(CreateSimilarProposalInputRolledGostEvent(value)),
                    ),
                    ParamsFieldWidget(
                      title: 'Марка материала *', //обязательное
                      controller: _brandMaterialTextController,
                      inputType: TextInputType.text,
                      onChanged: (value) => context
                          .read<CreateSimilarProposalBloc>()
                          .add(CreateSimilarProposalInputMaterialBrandEvent(value)),
                    ),
                    ParamsFieldWidget(
                      title: 'Параметры материала',
                      controller: _paramsMaterialTextController,
                      inputType: TextInputType.text,
                      onChanged: (value) => context
                          .read<CreateSimilarProposalBloc>()
                          .add(CreateSimilarProposalInputMaterialParamsEvent(value)),
                    ),
                    ParamsFieldWidget(
                      title: 'ГОСТ на материал',
                      controller: _gostMaterialTextController,
                      inputType: TextInputType.text,
                      onChanged: (value) => context
                          .read<CreateSimilarProposalBloc>()
                          .add(CreateSimilarProposalInputMaterialGostEvent(value)),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Потребность в заявке:',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          _requirement,
                          style: const TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Цена за тонну (с НДС)',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: TextField(
                            controller: _priceController,
                            onChanged: (val) {
                              if (val.isEmpty) {
                                setState(() {
                                  price = 0;
                                  context
                                      .read<CreateSimilarProposalBloc>()
                                      .add(CreateSimilarProposalInputPriceEvent(0));
                                  //.add(CreateSimilarProposalInputPriceEvent(double.parse(val)));
                                  context
                                      .read<CreateSimilarProposalBloc>()
                                      .add(CreateSimilarProposalInputPriceEvent(price));
                                });
                              } else {
                                setState(() {
                                  // НЕ ЗАБЫТЬ ОБРАБОТАТЬ БЛОКОМ КОД НИЖЕ
                                  //price = orderModel.requirement * double.parse(val);
                                  price = args.amount //* 2;
                                      *
                                      double.parse(val);
                                  context
                                      .read<CreateSimilarProposalBloc>()
                                      .add(CreateSimilarProposalInputPriceEvent(double.parse(val)));
                                  context
                                      .read<CreateSimilarProposalBloc>()
                                      .add(CreateSimilarProposalInputPriceEvent(price));
                                });
                              }
                            },
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[300],
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(15))),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('RUB', style: TextStyle(fontSize: 20, color: Colors.black))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Сумма (с НДС):',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          //state.pageState.request.fullPrice.toInt().toString(),
                          price.toInt().toString(),
                          style: const TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text('RUB', style: TextStyle(fontSize: 20, color: Colors.black))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'В наличии:',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedValue = 1;
                                _dateTextController.clear();
                                context
                                    .read<CreateSimilarProposalBloc>()
                                    .add(CreateSimilarProposalInputInStockEvent(true));
                                context
                                    .read<CreateSimilarProposalBloc>()
                                    .add(CreateSimilarProposalInputDeliverDateEvent(''));
                              });
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: selectedValue == 1 ? Colors.orange : Colors.grey),
                                child: Text(
                                  'Да',
                                  style:
                                      TextStyle(fontSize: 20, color: selectedValue == 1 ? Colors.white : Colors.black),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedValue = 2;
                                context
                                    .read<CreateSimilarProposalBloc>()
                                    .add(CreateSimilarProposalInputInStockEvent(false));
                              });
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: selectedValue == 2 ? Colors.orange : Colors.grey),
                                child: Text(
                                  'Нет',
                                  style:
                                      TextStyle(fontSize: 20, color: selectedValue == 2 ? Colors.white : Colors.black),
                                )),
                          ),
                        ),
                      ],
                    ),
                    selectedValue == 2
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Дата поступления\nна склад поставщика:',
                                style: TextStyle(fontSize: 20, color: Colors.black),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                onChanged: (value) {
                                  context
                                      .read<CreateSimilarProposalBloc>()
                                      .add(CreateSimilarProposalInputDeliverDateEvent(value));
                                },
                                controller: _dateTextController,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[300],
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.circular(15))),
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30, top: 30),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 65,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<CreateSimilarProposalBloc>().add(CreateSimilarProposalSendEvent());
                          },

                          /*
                    () async {
                      //Navigator.pushNamed(context, '/buyer_orders_list_page');

                      if (selectedValue == 1) {
                        _inStock = true;
                        _notStock = false;
                      } else if (selectedValue == 2) {
                        _inStock = false;
                        _notStock = true;
                      }
                      String dateCreate =
                          '${DateTime.now().day.toString().length < 2 ? "0${DateTime.now().day}" : DateTime.now().day}.${DateTime.now().month.toString().length < 2 ? "0${DateTime.now().month}" : DateTime.now().month}.${DateTime.now().year}';
                      await getIt
                          .get<ProfileRepository>()
                          .createProposal(
                              request: AnswerOrderModel(
                            idOrder: orderModel.id,
                            brandMaterial: _brandMaterialTextController.text,
                            gostMaterial: _gostMaterialTextController.text,
                            gostRolled: _gostRolledTextController.text,
                            paramsMaterial: _paramsMaterialTextController.text,
                            paramsRolled: _paramsRolledTextController.text,
                            requirement: orderModel.requirement,
                            sizeRolled: _sizeRolledTextController.text,
                            type: _typeTextController.text,
                            formRolled: orderModel.formRolled,
                            dataCreate: dateCreate,
                            dateToStorage: _dateTextController.text,
                            onStock: selectedValue == 1 ? true : false,
                            similar: true,
                            pricePerTonne: double.parse(_priceController.text),
                            priceFull: price,
                            idSupplier: getIt.get<ProfileRepository>().user.id,
                          ))
                          .whenComplete(() => Navigator.pushReplacementNamed(context, '/success_proposal_page'));
                    },
                    */
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
          );
        },
      ),
    );
    /*
    
    */
  }
}

class NDSWidget extends StatefulWidget {
  const NDSWidget({
    super.key,
    required this.startBool,
  });
  final List<bool> startBool;
  @override
  State<NDSWidget> createState() => _NDSWidgetState();
}

class _NDSWidgetState extends State<NDSWidget> {
  List<bool> listBool = [];
  List<String> listNames = ['с НДС', 'без НДС'];

  @override
  void initState() {
    listBool.addAll(widget.startBool);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: listBool
          .map((e) => Padding(
                padding: const EdgeInsets.only(left: 10),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (listBool.indexOf(e) == 0) {
                        listBool = [true, false];
                      } else {
                        listBool = [false, true];
                      }
                    });
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5), color: e ? Colors.orange : Colors.grey),
                      child: Text(
                        listNames[listBool.indexOf(e)],
                        style: TextStyle(fontSize: 20, color: e ? Colors.white : Colors.black),
                      )),
                ),
              ))
          .toList(),
    );
  }
}

class AvailableWidget extends StatefulWidget {
  const AvailableWidget({super.key, required this.startBool});
  final List<bool> startBool;

  @override
  State<AvailableWidget> createState() => _AvailableWidgetState();
}

class _AvailableWidgetState extends State<AvailableWidget> {
  List<bool> listBool = [];
  List<String> listNames = ['НЕТ', 'ДА'];

  @override
  void initState() {
    listBool.addAll(widget.startBool);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: listBool
          .map((e) => Padding(
                padding: const EdgeInsets.only(left: 10),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (listBool.indexOf(e) == 0) {
                        listBool = [true, false];
                      } else {
                        listBool = [false, true];
                      }
                    });
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5), color: e ? Colors.orange : Colors.grey),
                      child: Text(
                        listNames[listBool.indexOf(e)],
                        style: TextStyle(fontSize: 20, color: e ? Colors.white : Colors.black),
                      )),
                ),
              ))
          .toList(),
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
