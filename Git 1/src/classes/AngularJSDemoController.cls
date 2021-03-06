public with sharing class AngularJSDemoController{ 
    
    public String AccountList { get; set; }
    
    //Subclass : Wrapper Class 
    public class Accountwrap {
        //Static Variables 
        public string id;
        public string name;
        public string Phone;
        public Boolean isChecked ;
        
        //Wrapper  Class Controller
        Accountwrap() {
        	System.debug('>>******@@123');
            Phone = '';
        }
        
    }
       
    //Method to bring the list of Account and Serialize Wrapper Object as JSON
    public  static String getlstAccount() {
        List < Accountwrap > lstwrap = new List < Accountwrap > ();
        List < account > lstacc = [SELECT Id, Name, Phone
                                   FROM Account 
                                  ];
        for (Account a: lstacc) {
            Accountwrap awrap = new Accountwrap();
            awrap.id = a.id;
            awrap.name = a.name;
            if (a.Phone != null) {
                awrap.Phone = a.Phone;
            }
            awrap.isChecked = false;
            lstwrap.add(awrap);
        }
        
        system.debug('>>>>>>>>>>>'+JSON.serialize(lstwrap));
        return JSON.serialize(lstwrap);
     }
    
}