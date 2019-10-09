import 'package:flutter/material.dart';
import 'package:jommalaysia/core/enums/viewstate.dart';
import 'package:jommalaysia/core/providers/base_provider.dart';
import 'package:jommalaysia/core/services/location_service.dart';

class StateDropdownProvider extends BaseProvider {
  final LocationService _locationService;

  StateDropdownProvider({@required LocationService locationService})
      : _locationService = locationService;

  List<String> _stateList;
  List<String> get stateList => _stateList;

  String _selectedLocation;
  get selectedLocation => _selectedLocation;

  String _currentLocation;
  get currentLocation => _currentLocation;

  Future<void> populateDropdown() async {
    getCurrentLocation();
    getStateList();
  }

  Future<bool> getCurrentLocation() async {
    setState(ViewState.Busy);
    _currentLocation = await _locationService.fetchUserLocation();
    _selectedLocation = _currentLocation;
    setState(ViewState.Idle);
    return true;
  }

  Future<bool> getStateList() async {
    setState(ViewState.Busy);
    _stateList = await _locationService.fetchEnabledStates();
    setState(ViewState.Idle);
    return true;
  }

  void dropdownSelected(String state) {
    _selectedLocation = state;
    notifyListeners();
  }
}
