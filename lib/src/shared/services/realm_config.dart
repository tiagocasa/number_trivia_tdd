import 'package:realm/realm.dart';

LocalConfiguration config = Configuration.local(
  [],
  initialDataCallback: (realm) {
    // realm.add(
    //   ConfigurationData('system'),
    // );
  },
);
