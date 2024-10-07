import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gesture/app_getx_binding.dart';
import 'package:gesture/checkbox_state.dart';
import 'package:gesture/global_constant.dart';
import 'package:gesture/log.dart';
import 'package:gesture/radio_state.dart';
import 'package:gesture/slider_state.dart';
import 'package:gesture/switch_state.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Hello Gesture")),
        body: const Home(),
      ),
      initialBinding: AppBinding(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Column(
      children: [MyCheckBoxes(), MyRadioButtons(), MySlider(), MySwitch(), MyPopupMenu()],
    ));
  }
}

class MyCheckBoxes extends StatelessWidget {
  const MyCheckBoxes({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            Checkbox(value: CheckboxState.to.getState(0), onChanged: (value) => change(0, selected: value)),
            Checkbox(value: CheckboxState.to.getState(1), onChanged: (value) => change(1, selected: value)),
            Checkbox(value: CheckboxState.to.getState(2), onChanged: (value) => change(2, selected: value)),
          ],
        ));
  }

  void change(int i, {bool? selected = false}) {
    if (selected!) {
      CheckboxState.to.select(i);
    } else {
      CheckboxState.to.deselect(i);
    }
  }
}

class MyRadioButtons extends StatelessWidget {
  const MyRadioButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Obx(
      () => Column(
        children: [
          ListTile(
            leading: Radio<RadioGroup>(
                value: RadioGroup.value1,
                groupValue: RadioState.to.getRadioValue(),
                onChanged: (RadioGroup? value) => change(value: RadioGroup.value1)),
            title: Text("Radio 1"),
            onTap: () => change(value: RadioGroup.value1),
          ),
          ListTile(
            leading: Radio<RadioGroup>(
                value: RadioGroup.value2,
                groupValue: RadioState.to.getRadioValue(),
                onChanged: (RadioGroup? value) => change(value: RadioGroup.value2)),
            title: Text("Radio 2"),
            onTap: () => change(value: RadioGroup.value2),
          ),
          ListTile(
            leading: Radio<RadioGroup>(
                value: RadioGroup.value3,
                groupValue: RadioState.to.getRadioValue(),
                onChanged: (RadioGroup? value) => change(value: RadioGroup.value3)),
            title: Text("Radio 3"),
            onTap: () => change(value: RadioGroup.value3),
          ),
        ],
      ),
    ));
  }

  void change({RadioGroup? value = RadioGroup.value1}) {
    RadioState.to.setRadioValue(value!);
  }
}

class MySlider extends StatelessWidget {
  const MySlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Slider(
        value: SliderState.to.getSliderValue(),
        divisions: 100,
        min: 0,
        max: 100,
        onChanged: (double value) {
          SliderState.to.setSliderValue(value);
        },
        label: "slider value ${SliderState.to.getSliderValue().toInt()}",
        activeColor: Colors.green.shade200,
        inactiveColor: Colors.green,
      );
    });
  }
}

class MySwitch extends StatelessWidget {
  const MySwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        children: [
          Switch(
            value: SwitchState.to.getSliderValue(),
            onChanged: (bool value) {
              SwitchState.to.setSwitch(value);
            },
          ),
          CupertinoSwitch(
            value: SwitchState.to.getSliderValue(),
            onChanged: (bool value) {
              SwitchState.to.setSwitch(value);
            },
          )
        ],
      );
    });
  }
}

class MyPopupMenu extends StatelessWidget {
  const MyPopupMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return ContextMenuForEdit.values.map((e) => PopupMenuItem(value: e, child: Text(e.name))).toList();
      },
      onSelected: (value) {
        Log.s.d("$value selected in MyPopupMenu");
      },
    );
  }
}
