public class LabelController {

    @AuraEnabled
    public static string getLabel(){
        string s1='hello i am from apex controller';
        string s2=System.Label.helloworld;
        return s1+s2;
    }
}