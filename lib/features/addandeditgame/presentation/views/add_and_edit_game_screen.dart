import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yalla_harek/core/common/app_color.dart';
import 'package:yalla_harek/core/common/app_text.dart';
import 'package:yalla_harek/core/data/datasources/local/entities/game_entity.dart';
import 'package:yalla_harek/core/presentation/widgets/edit_text_input.dart';
import 'package:yalla_harek/core/presentation/widgets/main_button.dart';
import 'package:yalla_harek/features/addandeditgame/domain/entities/game.dart';
import 'package:yalla_harek/features/addandeditgame/presentation/blocs/add_and_edit_game_bloc.dart';
import 'package:yalla_harek/injector.dart';
import 'dart:io' as Io;

class AddAndEditGameScreen extends StatefulWidget {
  static const String id = 'add_and_edit_game_screen';

  const AddAndEditGameScreen({Key? key}) : super(key: key);

  @override
  State<AddAndEditGameScreen> createState() => _AddAndEditGameScreenState();
}

class _AddAndEditGameScreenState extends State<AddAndEditGameScreen> {
  String? title = "";
  int? id = -1;
  String? description = "";
  int? maxCountPlayers = 0;
  String? gameDate = "";
  AddAndEditGameBloc? _addAndEditGameBloc;
  GameEntity? editGameEntity;
  ImagePicker? picker;
  XFile? image;
  File? _image;

  @override
  void initState() {
    _addAndEditGameBloc = injector<AddAndEditGameBloc>();
    picker = ImagePicker();

    super.initState();
  }

  void pickImage() async {
    image = await picker!.pickImage(source: ImageSource.camera);
    print(image);
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    editGameEntity = arguments['exampleArgument'];

    if (editGameEntity != null) {
      title = editGameEntity!.title == null ? "" : editGameEntity!.title;
      description = editGameEntity!.description == null
          ? ""
          : editGameEntity!.description;
      maxCountPlayers = editGameEntity!.countOfPlayers == null
          ? 0
          : editGameEntity!.countOfPlayers;
      gameDate = editGameEntity!.date == null ? "" : editGameEntity!.date;
      id = editGameEntity!.id;
    }
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Game', style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildBody() {
    return BlocProvider(
      create: (context) => _addAndEditGameBloc!,
      child: BlocBuilder<AddAndEditGameBloc, AddAndEditGameState>(
        builder: (context, state) {
          if (state is AddAndEditGameLoading) {
            return const Center(child: CupertinoActivityIndicator());
          } else
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          EditTextInput(
                            initialText: title,
                            title: 'Title',
                            hintText: 'Enter title',
                            onChangeInput: (value) {
                              title = value.toString();
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          EditTextInput(
                            initialText: description,
                            title: 'Description',
                            hintText: 'Enter description',
                            onChangeInput: (value) {
                              description = value.toString();
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          EditTextInput(
                            initialText: maxCountPlayers.toString(),
                            title: 'Max count of players',
                            hintText: 'Enter max count of players',
                            onChangeInput: (value) {
                              maxCountPlayers = int.parse(value.toString());
                            },
                            textInputType: TextInputType.number,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Game Date",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  child: GestureDetector(
                                    onTap: () {
                                      DatePicker.showDateTimePicker(
                                        context,
                                        theme: DatePickerTheme(
                                          headerColor: MyColors.primary,
                                          backgroundColor: Colors.white,
                                          itemStyle: MyText.myTitle(context)!.copyWith(
                                            color: MyColors.grey_100_,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          doneStyle: MyText.myTitle(context)!.copyWith(
                                            color: MyColors.white,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          cancelStyle:
                                              MyText.myTitle(context)!.copyWith(
                                            color: MyColors.white,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        onConfirm: (date) {
                                          setState(() {
                                            gameDate = date.toString();
                                          });
                                        },
                                        locale: LocaleType.en,
                                      );
                                    },
                                    child: TextFormField(
                                      key: Key(gameDate.toString()),
                                      initialValue: gameDate == null
                                          ? 'choose date game'
                                          : gameDate.toString(),
                                      enabled: false,
                                      style: MyText.myTitle(context)!.copyWith(
                                        color: MyColors.grey_100_,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(5.0),
                                        hintText: "Enter your birth date",
                                        hintStyle:
                                            Theme.of(context).textTheme.bodyText2,
                                        filled: true,
                                        fillColor: Colors.white70,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(10.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          _image == null
                              ? Container()
                              : Container(
                            padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 0.1,
                                        blurRadius: 3,
                                        offset:
                                            Offset(0, 0), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Image.file(
                                    _image!,
                                    width: MediaQuery.of(context).size.width,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 10.0,
                              ),
                              MainButton(
                                title: "Add Image",
                                onClickCallback: () async {
                                  image = await picker!.pickImage(
                                    source: ImageSource.gallery,
                                    imageQuality: 50,
                                  );
                                  setState(() {
                                    _image = File(image!.path);
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: MainButton(
                                title: 'Save',
                                onClickCallback: () async {
                                  if (id == -1) {
                                    _addAndEditGameBloc!
                                      ..add(UpdateOrInsertGameEvent(
                                          game: Game(
                                            title: title,
                                            date: gameDate,
                                            countOfPlayers: maxCountPlayers,
                                            description: description,
                                          )));
                                  } else {
                                    _addAndEditGameBloc!
                                      ..add(UpdateOrInsertGameEvent(
                                          game: Game(
                                            id: id,
                                            title: title,
                                            date: gameDate,
                                            countOfPlayers: maxCountPlayers,
                                            description: description,
                                          )));
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
