public with sharing class git {
	
	public list<Account> accs{get;set;}
    
  publlic git(){
  	accs=[select id,name from account limit 25];
  }
}
