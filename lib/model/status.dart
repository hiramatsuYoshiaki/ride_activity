enum ApplicationLoginState {
  loggedOut,
  emailAdress,
  register,
  password,
  welcom,
  sendEmail,
  loggedIn,
  passReset
}

enum ProfileState {
  photoUpdate,
  dispalyNameUpdate,
  emailUpdate,
  display,
  removeAccount
}

enum HomeState { display, homeDetail, homeParticipation }

enum ActivityState {
  display,
  activityDetail,
  activityAdd,
  activityAddElement,
  activityRemove,
  activityEdit,
  activityDone,
}

enum RiderState {
  display,
  riderDetail,
  riderAdd,
  riderRemove,
  riderEdit,
}

enum AuthState {
  loggedIn,
  loggedOut,
}

enum loadState {
  loading,
  waiting,
}
