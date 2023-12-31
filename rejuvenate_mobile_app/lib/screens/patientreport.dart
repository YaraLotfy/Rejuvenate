// ignore_for_file: constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rejuvenate_mobile_app/widgets/answer_type.dart';
import '../../utils/validations.dart';
import '../services/user_services.dart';

enum GenderTypeEnum { Male, Female }

Future<void> add(String id) async {
  WidgetsFlutterBinding.ensureInitialized();
}

class PatientReport extends StatefulWidget {
  const PatientReport({super.key});

  @override
  State<PatientReport> createState() => _PatientReportState();
}

class _PatientReportState extends State<PatientReport> {
  final _nameController = TextEditingController();
  final _problemController = TextEditingController();
  AnswerTypeEnum? _answerTypeEnum;
  _PatientReportState() {
    _selectedVal = _sugarTypeList[0];
  }
  GenderTypeEnum? _genderTypeEnum;
  final _sugarTypeList = ["Sugar Type 1", "Sugar Type 2", "NONE"];
  String? _selectedVal = "Sugar Type 1";

  @override
  void dispose() {
    _nameController.dispose();
    _problemController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 40.0),
          child: Center(
              child: Text('Patient Report',
                  style: GoogleFonts.robotoSlab(
                      fontSize: 30, fontWeight: FontWeight.bold))),
        ),
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: const Color.fromARGB(255, 1, 6, 29),
        shadowColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (!value!.isNotEmpty && !value.isValidName) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Choose the Gender',
                    style: TextStyle(
                        color: Color.fromARGB(255, 1, 6, 29),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<GenderTypeEnum>(
                          activeColor: const Color.fromARGB(255, 1, 6, 29),
                          value: GenderTypeEnum.Male,
                          groupValue: _genderTypeEnum,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0)),
                          title: Text(GenderTypeEnum.Male.name),
                          onChanged: (val) {
                            setState(() {
                              _genderTypeEnum = val;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: RadioListTile<GenderTypeEnum>(
                          activeColor: const Color.fromARGB(255, 1, 6, 29),
                          value: GenderTypeEnum.Female,
                          groupValue: _genderTypeEnum,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 2.0),
                          ),
                          title: Text(GenderTypeEnum.Female.name),
                          onChanged: (val) {
                            setState(
                              () {
                                _genderTypeEnum = val;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField(
                    value: _selectedVal,
                    items: _sugarTypeList
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        _selectedVal = val;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color.fromARGB(255, 1, 6, 29),
                    ),
                    decoration: const InputDecoration(
                      labelText: "Sugar Types",
                      prefixIcon: Icon(
                        Icons.accessibility_new_rounded,
                        color: Color.fromARGB(255, 1, 6, 29),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  //BLOOD
                  const Text(
                    'Do you have Blood Pressure?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 1, 6, 29),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  const AnswerType(),
                  const SizedBox(
                    height: 20,
                  ),
                  //Problems
                  const Text(
                    'Do you have any known cardiovascular problems (abnormal ECG, previous heart attack, etc)?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 1, 6, 29),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10.0),
                  const AnswerType(),
                  const SizedBox(
                    height: 20,
                  ),

                  //medicine
                  const Text(
                    'Are you taking any prescribed medications or dietary supplementation?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 1, 6, 29),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10.0),
                  const AnswerType(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "If yes enter the name of the medicine",
                    style: TextStyle(
                        color: Color.fromARGB(255, 1, 6, 29),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  TextFormField(
                    controller: _problemController,
                    decoration: const InputDecoration(
                      labelText: 'Medicine name',
                    ),
                    validator: (value) {
                      if (!value!.isNotEmpty) {
                        return 'Please enter your medicine name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 1, 6, 29),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 7),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                        onPressed: () async {
                          if (_nameController.text.isNotEmpty &&
                            _problemController.text.isNotEmpty )
                            {
                          UserService().saveUserpatientreport(
                             
                             _nameController.text,
                             _genderTypeEnum.toString(),
                             _answerTypeEnum.toString(),
                             _selectedVal.toString(),
                             _problemController.text);

                          Navigator.pushNamed(context, '/dashboard');
                          }
                        },
                        child: Column(
                          children: const [
                            Icon(
                              Icons.done_outlined,
                              color: Colors.white,
                            ),
                            Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        )
                        
                      ),
  
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 1, 6, 29),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 7),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                        onPressed: () {
                          Navigator.pushNamed(context, '/dashboard');
                        },
                        child: Column(
                          children: const [
                            Icon(Icons.remove_circle_outline,
                                color: Colors.white),
                            Text(
                              'Cancel',
                              style: TextStyle(color: Colors.white,fontSize: 30,),
                              
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
