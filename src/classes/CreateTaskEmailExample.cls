global class CreateTaskEmailExample implements Messaging.InboundEmailHandler {
 
  global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, 
                                                       Messaging.InboundEnvelope env){
 
                                                 
    // Create an InboundEmailResult object for returning the result of the 
    // Apex Email Service
    Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
  
    String myPlainText= '';
    
    // Add the email plain text into the local variable 
    myPlainText = email.plainTextBody;     
    
    //Create a New Object
    Anexos__c Anexo = new Anexos__c();
                                                           
    try {                                                       
                                                           
        Anexo.SubjectEmail__c = email.subject;   
        
        System.debug('Entrou aqui dentro do email');
        
        insert Anexo; 
        
         // Save attachments, if any
        
        if(email.textAttachments!=null){         
            for (Messaging.Inboundemail.TextAttachment tAttachment : email.textAttachments) {
                Attachment attachment = new Attachment();
                
                attachment.Name = tAttachment.fileName;
                attachment.Body = Blob.valueOf(tAttachment.body);
                attachment.ParentId = Anexo.Id;
                insert attachment;
            }
         }
        
        //Save any Binary Attachment
        
        if(email.binaryAttachments!=null){  
        
            for (Messaging.Inboundemail.BinaryAttachment bAttachment : email.binaryAttachments) {
                Attachment attachment = new Attachment();
                
                attachment.Name = bAttachment.fileName;
                attachment.Body = bAttachment.body;
                attachment.ParentId = Anexo.Id;
                insert attachment;
            }
            
        }
        
       
    }
   catch (QueryException e) {
       System.debug('Query Issue: ' + e);
   }
                                                                                                                 
    // New Task object to be created
    //Task[] newTask = new Task[0];
   
    // Try to look up any contacts based on the email from address
    // If there is more than one contact with the same email address,
    // an exception will be thrown and the catch statement will be called.
    /*try {
      Contact vCon = [SELECT Id, Name, Email
        FROM Contact
        WHERE Email = :email.fromAddress
        LIMIT 1];
      
      // Add a new Task to the contact record we just found above.
      newTask.add(new Task(Description =  myPlainText,
           Priority = 'Normal',
           Status = 'Inbound Email',
           Subject = email.subject,
           IsReminderSet = true,
           ReminderDateTime = System.now()+1,
           WhoId =  vCon.Id));
     
     // Insert the new Task 
     insert newTask;    
     
     System.debug('New Task Object: ' + newTask );   
    }
    // If an exception occurs when the query accesses 
    // the contact record, a QueryException is called.
    // The exception is written to the Apex debug log.
   catch (QueryException e) {
       System.debug('Query Issue: ' + e);
   }*/
   
   // Set the result to true. No need to send an email back to the user 
   // with an error message
   result.success = true;
   
   // Return the result for the Apex Email Service
   return result;
  }
}