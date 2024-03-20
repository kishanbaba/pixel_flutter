abstract class BaseService<T> {
  final String baseURL = 'http://api.pixelmanagement.in/api/';
  final String loginUrl = 'ClientLogin';
  final String projectUrl = 'ClientProjects';
  final String clientPayment = 'ClientPayments';
  final String projectClientNoteUpate = 'ProjectClientNoteUpate';
  final String officeHolidays = 'ClientHolidays';
  final String sameDayAdd = 'ClientDaySameAdd';
  final String sameDay = 'ClientDaySame';
  final String dashboardUrl = 'ClientDashboard';
  final String clientChangePassword = 'ClientPasswordChange';
  final String clientCreateAndUpdate = 'Client';
  final String clientDelete = 'ClientDelete';
  final String clientDetail = 'ClientDetail';
  final String clientGetCountryCurrency = 'GetCountryCurrency';
}
