// Dynamic SOQL Example:
// syntax: Database.query(String)

public with sharing class DynamicSOQL {
    public static List<SObject> main(String[] query , String obj) {
        String str = 'Select Id';

        for(String q : query){
            str += ', ' + q;
        }
        str += ' From ' + obj;
        String qr = String.escapeSingleQuotes(str);
        List<SObject> res = Database.query(qr);
        return res;
    }
}