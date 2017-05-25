public class FileController {
    
    @AuraEnabled
    public static Id saveTheFile(Id parentId, String fileName, String base64Data, String contentType) { 
        
        Attachment a = new Attachment();
        
        try {

            base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
            a.parentId = parentId;
    
            a.Body = EncodingUtil.base64Decode(base64Data);
            a.Name = fileName;
            a.ContentType = contentType;
            
            insert a;
            
        } catch(Exception e) {
			System.debug(e.getMessage());	
    	}     
        
         return a.Id;
    }
    
    @AuraEnabled
    public static Id saveTheChunk(Id parentId, String fileName, String base64Data, String contentType, String fileId) { 
        if (fileId == null ||fileId == '') {
            fileId = saveTheFile(parentId, fileName, base64Data, contentType);
        } else {
            fileId = appendToFile(fileId, base64Data);
        }
        
        return ID.valueof(fileId);
    }
    
    private static Id appendToFile(Id fileId, String base64Data) {
        System.debug('appendToFile');
        
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        
        Attachment a = [
            SELECT Id, Body
            FROM Attachment
            WHERE Id = :fileId
        ];
        
     	String existingBody = EncodingUtil.base64Encode(a.Body);
        a.Body = EncodingUtil.base64Decode(existingBody + base64Data); 
        
        update a;
        
        return a.Id;
    }
}