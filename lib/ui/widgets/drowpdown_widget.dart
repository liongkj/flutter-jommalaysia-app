import 'package:flutter/material.dart';
import 'package:jommalaysia/core/enums/viewstate.dart';
import 'package:jommalaysia/core/providers/widgets/state_dropdown_provider.dart';
import 'package:jommalaysia/ui/widgets/base_widget.dart';
import 'package:provider/provider.dart';

class DropdownWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<StateDropdownProvider>(
      model: StateDropdownProvider(locationService: Provider.of(context)),
      onModelReady: (model) => {model.populateDropdown()},
      builder: (context, model, child) => model.state == ViewState.Busy
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: EdgeInsets.only(left: 8.0),
              child: DropdownButton<String>(
                value: model.selectedLocation,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: Theme.of(context).textTheme.title,
                items: (model.stateList)
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                underline: Container(
                  height: 0,
                ),
                onChanged: (String newState) {
                  model.dropdownSelected(newState);
                },
              ),
            ),
    );
  }
}
