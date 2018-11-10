public Class AvoidRecursion{

    public static Boolean isbeforeinsertExecuted = false;
    public static Boolean isbeforeupdateExecuted = false;
    public static Boolean isafterinsertExecuted = false;
    public static Boolean isafterupdateExecuted = false;
    public static Boolean STOP_RECURSION = TRUE;
    public static Set<Id> contactEntitlementIds= new set<ID> ();
    
    public static boolean stopRecursion(){
        return (STOP_RECURSION == TRUE) ? true:false; 
        
        
    }
}