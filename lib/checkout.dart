import 'package:flutter/material.dart';

import './colors.dart';

class Checkout extends StatefulWidget {
  @override
  _Checkout createState() => _Checkout();
}

class _Checkout extends State<Checkout> {
  int _activeStep = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Container(
          child: Theme(
            data: ThemeData(
              primaryColor: kBlueBlue50,
            ),
            child: Stepper(
              steps: _getSteps(),
              type: StepperType.vertical,
              currentStep: _activeStep,
              onStepContinue: _moveToNextStep,
              onStepCancel: _moveToPreviousStep,
              onStepTapped: (step) {
                setState(() {
                  _activeStep = step;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  List<Step> _checkoutSteps = <Step>[];

  TextStyle _stepTextStyle = TextStyle(fontFamily: 'Ubuntu');

  List<Step> _getSteps() {
    _checkoutSteps = <Step>[
      Step(
        title: Text('Address', style: _stepTextStyle),
        content: TextField(),
        state: (_activeStep == 0) ? StepState.editing : StepState.complete,
        isActive: _activeStep >= 0,
      ),
      Step(
        title: Text('Phone', style: _stepTextStyle),
        content: TextField(),
        state: (_activeStep == 1) ? StepState.editing : StepState.complete,
        isActive: _activeStep >= 1,
      ),
      Step(
        title: Text('Payment', style: _stepTextStyle),
        content: TextField(),
        state: (_activeStep == 2) ? StepState.editing : StepState.indexed,
        isActive: _activeStep >= 2,
      ),
      Step(
        title: Text('Verify Orders', style: _stepTextStyle),
        content: TextField(),
        state: (_activeStep == 3) ? StepState.editing : StepState.error,
        isActive: _activeStep >= 3,
      ),
    ];
    return _checkoutSteps;
  }

  void _moveToNextStep() {
    setState(() {
      if (_activeStep < (_getSteps().length - 1))
        _activeStep++;
      else
        Navigator.pop(context);
    });
  }

  void _moveToPreviousStep() {
    setState(() {
      if (_activeStep > 0)
        _activeStep = (_activeStep - 1);
      else
        _activeStep = 0;
    });
  }
}
