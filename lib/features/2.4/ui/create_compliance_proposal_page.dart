import 'package:buy_metal_app/data/models/application_models/application_upload_search_response.dart';
import 'package:buy_metal_app/domain/repository/application_response_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:buy_metal_app/domain/router/route_constants.dart';
import 'package:buy_metal_app/domain/router/route_impl.dart';
import 'package:buy_metal_app/features/2.4/bloc/create_compliance_proposal_bloc.dart';
import 'package:buy_metal_app/features/core_widgets/error_dialog_widget.dart';
import 'package:buy_metal_app/features/core_widgets/rolled_form_ru_name_converter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateComplianceProposalPage extends StatefulWidget {
  const CreateComplianceProposalPage({super.key, required this.args});
  final Object? args;

  @override
  State<CreateComplianceProposalPage> createState() => _CreateComplianceProposalPageState();
}

class _CreateComplianceProposalPageState extends State<CreateComplianceProposalPage> {
  //late UserModel userModel;
  //late OrderModel orderModel;
  final TextEditingController priceController = TextEditingController();
  //final TextEditingController dateToStorageController = TextEditingController();
  MaskTextInputFormatter dateToStorageController =
      MaskTextInputFormatter(mask: '####-##-##', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.lazy);

  double price = 0;
  int selectedValue = 0;

  late final ApplicationUploadSearchResponse args;
  @override
  void initState() {
    //Map<String, dynamic> map = widget.args != null ? widget.args as Map<String, dynamic> : {};
    //orderModel = map['order_model'];
    //userModel = map['user_model'];
    args = widget.args as ApplicationUploadSearchResponse;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final args = ModalRoute.of(context)!.settings.arguments as ApplicationUploadSearchResponse;
    //final args = widget.args as ApplicationUploadSearchResponse;
    return BlocProvider(
      create: (context) => CreateComplianceProposalBloc(
        applicationResponseRepository: context.read<GetIt>().get<ApplicationResponseRepository>(),
        userRepository: context.read<GetIt>().get<UserRepository>(),
        applicationInfo: args,
        pageState: const PageState(),
      ),
      child: BlocConsumer<CreateComplianceProposalBloc, CreateComplianceProposalState>(
        listener: (context, state) {
          if (state is CreateComplianceProposalError) {
            ErrorDialog(
              dialogTittle: 'Ошибка',
              dialogText: state.pageState.errMsg,
            ).showMyDialog(context);
          }
          if (state is CreateComplianceProposalAllowedToPush) {
            //Navigator.pushReplacementNamed(context, '/success_proposal_page');
            context.read<RouteImpl>().go(FindCustomerRoutes.successProposal.name);
          }
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black87,
                title: const Text('Описание предложения'),
                centerTitle: true,
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<CreateComplianceProposalBloc>().add(CreateComplianceProposalSendProposal());
                    },
                    /* 
              () async {
                String dateCreate =
                    '${DateTime.now().day.toString().length < 2 ? "0${DateTime.now().day}" : DateTime.now().day}.${DateTime.now().month.toString().length < 2 ? "0${DateTime.now().month}" : DateTime.now().month}.${DateTime.now().year}';
                await getIt
                    .get<ProfileRepository>()
                    .createProposal(
                        request: AnswerOrderModel(
                      idOrder: orderModel.id,
                      brandMaterial: orderModel.brandMaterial,
                      gostMaterial: orderModel.gostMaterial,
                      gostRolled: orderModel.gostRolled,
                      paramsMaterial: orderModel.paramsMaterial,
                      paramsRolled: orderModel.paramsRolled,
                      requirement: orderModel.requirement,
                      sizeRolled: orderModel.sizeRolled,
                      type: orderModel.type,
                      formRolled: orderModel.formRolled,
                      dataCreate: dateCreate,
                      dateToStorage: dateToStorageController.text,
                      onStock: selectedValue == 1 ? true : false,
                      similar: false,
                      pricePerTonne: double.parse(priceController.text),
                      priceFull: price,
                      idSupplier: getIt.get<ProfileRepository>().user.id,
                    ))
                    .whenComplete(
                        () => Navigator.pushReplacementNamed(context, '/success_proposal_page'));
              },
               */
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    child: const Text(
                      'Сформировать предложение',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        const Text(
                          'Номенклатура:',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${rolledFormRuNameConverter(args.rolledForm)} ${args.rolledType} ${args.rolledSize}', //форма проката + классификация/тип профиля + размер
                          style: const TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Text(
                          '${args.rolledParams} ${args.rolledGost}', //параметры проката + гост на прокат
                          style: const TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Text(
                          '${args.materialBrand} ${args.materialParams} ${args.materialGost}', //марка материала + параметры материала + ГОСТ на материал
                          style: const TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
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
                              '${args.amount} т',
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
                                controller: priceController,
                                onChanged: (val) {
                                  if (val.isEmpty) {
                                    setState(() {
                                      price = 0;
                                      context
                                          .read<CreateComplianceProposalBloc>()
                                          .add(CreateComplianceProposalInputPrice(0));
                                      context
                                          .read<CreateComplianceProposalBloc>()
                                          .add(CreateComplianceProposalInputPrice(price));
                                    });
                                  } else {
                                    setState(() {
                                      price = args.amount * double.parse(val);
                                      context
                                          .read<CreateComplianceProposalBloc>()
                                          .add(CreateComplianceProposalInputPrice(double.parse(val)));
                                      context
                                          .read<CreateComplianceProposalBloc>()
                                          .add(CreateComplianceProposalInputFullPrice(price));
                                      //orderModel.requirement * double.parse(val);
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
                        state.pageState.errorPriceText != null && state.pageState.priceError
                            ? Padding(
                                padding: const EdgeInsets.only(top: 2, bottom: 2),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                  decoration: const BoxDecoration(
                                      color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                                  child: Text(
                                    state.pageState.errorPriceText,
                                    style:
                                        const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.red),
                                  ),
                                ),
                              )
                            : const SizedBox(
                                height: 22,
                              ),
                        /* const SizedBox(
                          height: 10,
                        ), */
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
                                    dateToStorageController.clear();
                                    context
                                        .read<CreateComplianceProposalBloc>()
                                        .add(CreateComplianceProposalInputInStock(true));
                                    context
                                        .read<CreateComplianceProposalBloc>()
                                        .add(CreateComplianceProposalInputDeliverDate(''));
                                  });
                                },
                                child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: selectedValue == 1 ? Colors.orange : Colors.grey),
                                    child: Text(
                                      'Да',
                                      style: TextStyle(
                                          fontSize: 20, color: selectedValue == 1 ? Colors.white : Colors.black),
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
                                        .read<CreateComplianceProposalBloc>()
                                        .add(CreateComplianceProposalInputInStock(false));
                                  });
                                },
                                child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: selectedValue == 2 ? Colors.orange : Colors.grey),
                                    child: Text(
                                      'Нет',
                                      style: TextStyle(
                                          fontSize: 20, color: selectedValue == 2 ? Colors.white : Colors.black),
                                    )),
                              ),
                            ),
                          ],
                        ),
                        state.pageState.errorAvailableSelectedText != null && state.pageState.availableSelectedError
                            ? Padding(
                                padding: const EdgeInsets.only(top: 2, bottom: 2),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                  decoration: const BoxDecoration(
                                      color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                                  child: Text(
                                    state.pageState.errorAvailableSelectedText,
                                    style:
                                        const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.red),
                                  ),
                                ),
                              )
                            : const SizedBox(
                                height: 22,
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
                                    // dateToStorageController
                                    inputFormatters: [dateToStorageController],
                                    //controller: dateToStorageController,
                                    onChanged: (value) {
                                      context
                                          .read<CreateComplianceProposalBloc>()
                                          .add(CreateComplianceProposalInputDeliverDate(value));
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
                                  state.pageState.errorDeliverDateText != null && state.pageState.deliverDateError
                                      ? Padding(
                                          padding: const EdgeInsets.only(top: 2, bottom: 2),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(Radius.circular(10))),
                                            child: Text(
                                              state.pageState.errorDeliverDateText,
                                              style: const TextStyle(
                                                  fontSize: 12, fontWeight: FontWeight.w400, color: Colors.red),
                                            ),
                                          ),
                                        )
                                      : const SizedBox(
                                          height: 22,
                                        ),
                                ],
                              )
                            : const SizedBox.shrink(),
                        /* state.pageState.errorDeliverDateText != null && state.pageState.deliverDateError
                            ? Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[900], borderRadius: BorderRadius.all(Radius.circular(10))),
                                  child: Text(
                                    state.pageState.errorDeliverDateText,
                                    style:
                                        const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.red),
                                  ),
                                ),
                              )
                            : const SizedBox(
                                height: 22,
                              ), */
                      ]),
                    ],
                  ),
                ),
              ));
        },
      ),
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
  List<String> listNames = ['Да', 'Нет'];

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
