Global class scheduleExample implements Schedulable{

    Global void Execute(SchedulableContext sc){
        DescribeDataCategoryGroupSample1 d=new DescribeDataCategoryGroupSample1();
         CronTrigger  ct= [SELECT TimesTriggered, NextFireTime
           FROM CronTrigger WHERE Id = :sc.getTriggerId()];
         System.debug(ct);
    }
   
}