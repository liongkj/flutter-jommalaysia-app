import 'package:flutter/material.dart';
import 'package:jommalaysia/core/enums/viewstate.dart';
import 'package:jommalaysia/core/providers/base_provider.dart';
import 'package:jommalaysia/core/services/location_service.dart';

class StateDropdownProvider extends BaseProvider {
  StateDropdownProvider({@required LocationService locationService})
      : _locationService = locationService;

  final LocationService _locationService;

  List<String> _stateList;
  List<String> get stateList => _stateList;

  String _selectedLocation;
  String get selectedLocation => _selectedLocation;

  String _currentLocation;
  String get currentLocation => _currentLocation;

  Future<void> populateDropdown() async {
    await getCurrentLocation();
    await getStateList();
  }

  Future<bool> getCurrentLocation() async {
    setState(ViewState.busy);
    _currentLocation = await _locationService.fetchUserLocation();
    _selectedLocation = _currentLocation;
    setState(ViewState.idle);
    return true;
  }

  Future<bool> getStateList() async {
    setState(ViewState.busy);
    _stateList = await _locationService.fetchEnabledStates();
    setState(ViewState.idle);
    return true;
  }

  void dropdownSelected(String state) {
    _selectedLocation = state;
    notifyListeners();
  }
}
