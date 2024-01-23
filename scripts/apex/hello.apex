List<String> query = new List<String>();
query.add('Name');
query.add('Rating');
String objName = 'Account';

List<SObject> acc = DynamicSOQL.main(query, objName);
System.debug(acc);