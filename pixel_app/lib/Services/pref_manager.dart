import 'package:get_storage/get_storage.dart';

class PreferenceManager {
  static GetStorage getStorage = GetStorage();

  ///Client Id
  static Future setClientId(String clientId) async {
    await getStorage.write("clientId", clientId);
  }

  static String getClientId() {
    return getStorage.read("clientId") ?? '';
  }

  ///Employee Id
  static Future setEmployeeId(String employeeId) async {
    await getStorage.write("employeeId", employeeId);
  }

  static String getEmployeeId() {
    return getStorage.read("employeeId") ?? '';
  }

  ///userStatus
  static Future setUserType(String userType) async {
    await getStorage.write("userType", userType);
  }

  static String getUserType() {
    return getStorage.read("userType") ?? '';
  }

  ///Client Code
  static Future setClientCode(String clientCode) async {
    await getStorage.write("clientCode", clientCode);
  }

  static String getClientCode() {
    return getStorage.read("clientCode");
  }

  ///Role Code
  static Future setRoleCode(String roleCode) async {
    await getStorage.write("roleCode", roleCode);
  }

  static String getRoleCode() {
    return getStorage.read("roleCode");
  }

  ///EmailId
  static Future setEmailId(String emailId) async {
    await getStorage.write("emailId", emailId);
  }

  static String getEmailId() {
    return getStorage.read("emailId");
  }

  ///FNAME
  static Future setFastName(String FastName) async {
    await getStorage.write("FastName", FastName);
  }

  static String getFastName() {
    return getStorage.read("FastName");
  }

  ///LNAME
  static Future setLastName(String lastName) async {
    await getStorage.write("LastName", lastName);
  }

  static String getLastName() {
    return getStorage.read("LastName");
  }

  ///COMPANY NAME
  static Future setCompanyName(String companyName) async {
    await getStorage.write("companyName", companyName);
  }

  static String getCompanyName() {
    return getStorage.read("companyName");
  }

  ///CLEAR ALL PREF
  static allClearPreferenceManager() {
    return getStorage.erase();
  }
}
