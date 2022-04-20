import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:yalla_harek/core/common/app_color.dart';
import 'package:yalla_harek/core/common/app_text.dart';
import 'package:yalla_harek/core/data/datasources/local/entities/game_entity.dart';
import 'package:yalla_harek/core/presentation/widgets/main_button.dart';
import 'package:yalla_harek/core/presentation/widgets/my_card.dart';
import 'package:yalla_harek/features/addandeditgame/presentation/views/add_and_edit_game_screen.dart';
import 'package:yalla_harek/features/main/presentation/blocs/main_bloc.dart';
import 'package:yalla_harek/features/main/presentation/widgets/service_textfield.dart';

class GameWidget extends StatefulWidget {
  final GameEntity? game;
  final MainBloc? mainBloc;

  const GameWidget({Key? key, this.game, this.mainBloc}) : super(key: key);

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  File? imageFile = null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.game!.id.toString()),
      background: deleteBackground(),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          final bool res = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return showAlertDialog();
            },
          );
          return res;
        }
      },
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AddAndEditGameScreen.id, arguments: {
            'exampleArgument': widget.game,
          }).then((value) {
            widget.mainBloc!..add(GetAllGamesEvent());
          });
          },
        child: MyCard(
          childCard: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          widget.game!.title.toString(),
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Text(
                        "Players: " + widget.game!.countOfPlayers.toString(),
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Description: " + widget.game!.description.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          "Date: " + widget.game!.date.toString(),
                          style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return shareDialog();
                              });
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget showAlertDialog() {
    return AlertDialog(
      content: Text(
        "Are you sure you want to delete  ${widget.game!.title} ?",
        style: MyText.myTitle(context)!.copyWith(
          color: MyColors.grey_5,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontSize: 16.0,
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            "Cancel",
            style: MyText.myTitle(context)!.copyWith(
              color: MyColors.grey_5,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: 16.0,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: Text(
            "Delete",
            style: MyText.myTitle(context)!.copyWith(
              color: MyColors.accentDark,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: 16.0,
            ),
          ),
          onPressed: () {
            widget.mainBloc!
              ..add(
                DeleteGameEvent(
                    game: GameEntity(
                  id: widget.game!.id,
                  countOfPlayers: widget.game!.countOfPlayers,
                  title: widget.game!.title,
                  date: widget.game!.date,
                  description: widget.game!.description,
                  image: widget.game!.image,
                )),
              );
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget deleteBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  Widget shareDialog() {
    String? phoneNumber;
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: ServiceTextField(
                  textInputType: TextInputType.number,
                  textFieldWidth: MediaQuery.of(context).size.width,
                  hintText: "+9xx xxxx-xxxxx",
                  onChangeInput: (data, nameInput) {
                    phoneNumber = data;
                  },
                  inputBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffB4B4B4),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        8.0,
                      ),
                      topLeft: Radius.circular(
                        8.0,
                      ),
                      bottomRight: Radius.circular(
                        8.0,
                      ),
                      topRight: Radius.circular(
                        8.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Expanded(
                child: MainButton(
                  onClickCallback: () {
                    launchWhatsApp(
                      phoneNumber!,
                    );
                  },
                  title: "share",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  launchWhatsApp(String number) async {
    final link = WhatsAppUnilink(
      phoneNumber: number,
      text: "Title: " +
          widget.game!.title +
          "\n" +
          "Description: " +
          widget.game!.description.toString() +
          "\n" +
          "Date: " +
          widget.game!.date.toString(),
    );
    // Convert the WhatsAppUnlink instance to a string.
    // Use either Dart's string interpolation or the toString() method.
    // The "launch" method is part of "url_launcher".
    await launch('$link');
  }
}
