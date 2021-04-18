import 'package:flutter/material.dart';
import 'package:profesor_app/AllScreens/mainscreen.dart';
import 'package:profesor_app/AllScreens/registerationScreen.dart';
import 'package:profesor_app/configMaps.dart';
import 'package:profesor_app/main.dart';


class CarInfoScreen extends StatefulWidget
{
  static const String idScreen = "carinfo";

  @override
  _CarInfoScreenState createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  TextEditingController carModelTextEditingController = TextEditingController();

  TextEditingController carNumberTextEditingController = TextEditingController();

  TextEditingController carColorTextEditingController = TextEditingController();


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 22.0,),
              //Image.asset("images/logo.png", width: 390.0, height: 250.0,),
              Padding(
                padding: EdgeInsets.fromLTRB(22.0, 22.0, 22.0, 32.0),
                child: Column(
                  children: [
                    SizedBox(height: 12.0,),
                    Text("Informacion adicional", style: TextStyle(fontFamily: "Brand Bold", fontSize: 24.0),),

                    SizedBox(height: 26.0,),
                    TextField(
                      controller: carModelTextEditingController,
                      decoration: InputDecoration(
                        labelText: "CI o DNI",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0),

                      ),
                      style: TextStyle(fontSize: 15.0),
                    ),

                    SizedBox(height: 10.0,),
                    TextField(
                      controller: carNumberTextEditingController,
                      decoration: InputDecoration(
                        labelText: "Profesion",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0),

                      ),
                      style: TextStyle(fontSize: 15.0),
                    ),

                    SizedBox(height: 10.0,),
                    TextField(
                      controller: carColorTextEditingController,
                      decoration: InputDecoration(
                        labelText: "Materias a dictar",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0),

                      ),
                      style: TextStyle(fontSize: 15.0),
                    ),

                    SizedBox(height: 26.0,),

                    SizedBox(height: 42.0,),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: RaisedButton(
                        onPressed: ()
                        {
                          if(carModelTextEditingController.text.isEmpty)
                          {
                            displayToastMessage("por favor escribir su CI o DNI.", context);
                          }
                          else if(carNumberTextEditingController.text.isEmpty)
                          {
                            displayToastMessage("por favor escribir su profesion.", context);
                          }
                          else if(carColorTextEditingController.text.isEmpty)
                          {
                            displayToastMessage("por favor escribir las materias que va a dictar.", context);
                          }
                          else
                          {
                            saveDriverCarInfo(context);
                          }
                        },
                        color: Colors.black54,
                        child: Padding(
                          padding: EdgeInsets.all(17.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Siguiente", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),),
                              Icon(Icons.arrow_forward, color: Colors.white, size: 26.0,),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveDriverCarInfo(context)
  {
    String userId = currentfirebaseUser.uid;

    Map carInfoMap =
    {
      "dni": carColorTextEditingController.text,
      "profession": carNumberTextEditingController.text,
      "subjects": carModelTextEditingController.text,
    };

    driversRef.child(userId).child("details").set(carInfoMap);

    Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
  }
}
