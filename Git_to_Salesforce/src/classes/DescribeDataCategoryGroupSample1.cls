public class DescribeDataCategoryGroupSample1 {
    public static list<DescribeDataCategoryGroupResult>DescribeDataCategoryGroupSample1(){
        list<DescribeDataCategoryGroupResult> describeCategoryResult;
        try{
            //Creating the list of sobjects to use for the describe
             //call
            list<string> obj=new list<string>();
            obj.add('shiva');
            obj.add('kiran');
            // describe
            describeCategoryResult=schema.DescribeDataCategoryGroups(obj);
            System.debug(describeCategoryResult);
            
            for(DescribeDataCategoryGroupResult  singobjest: describeCategoryResult){
                singobjest.getName();
                singobjest.getLabel();
                singobjest.getSobject();
            }
            
        }catch(Exception e){
            System.debug(e);
        }
        return describeCategoryResult;
    } 
    
   
}