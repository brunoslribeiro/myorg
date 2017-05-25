({
	helperMethod : function() {
		
	},
    
    upload: function(cmp, file, fileContents) {
        
        var fromPos = 0;
        var toPos = Math.min(fileContents.length, fromPos + 750000);
        
        this.uploadChunk(cmp, file, fileContents, fromPos, toPos, ''); 
        
    },
    
    uploadChunk : function(component, file, fileContents, fromPos, toPos, paAttachId) {
        
        var action = component.get("c.saveTheChunk"); 
        var chunk = fileContents.substring(fromPos, toPos);
        
        action.setParams({
            parentId: component.get("v.parentId"),
            fileName: file.name,
            base64Data: encodeURIComponent(chunk), 
            contentType: file.type,
            fileId: paAttachId
        });
        
        var self = this;
        action.setCallback(this, function(a) {
            var result = a.getReturnValue();
            fromPos = toPos;
            toPos = Math.min(fileContents.length, fromPos + 750000);   
            console.log(fromPos +' - '+toPos);
            if (fromPos < toPos) {
                if(result!=null){
                    self.uploadChunk(component, file, fileContents, fromPos, toPos, result); 
                }
            }
        });
            
        $A.run(function() {
            $A.enqueueAction(action); 
        });
    }
    
})