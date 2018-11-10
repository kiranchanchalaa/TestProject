public class SimpleDynamicController {
    
    public Component.Apex.Detail getDynamicDetail(){
        Component.Apex.Detail details = new Component.Apex.Detail();
        details.expressions.subject='{!acct.OwnerId}';
        details.relatedList = false;
        details.title=false;
        return details;
    }
    public account acct{get{return[select id,Name,OwnerId from Account limit 1];}}
}