({
     
    save : function(cmp,evt,helper) {
        
        try{
            
            var fileInput = cmp.find('file').getElement();
            var file = fileInput.files[0];
       
            if (file.size > 4500000) {
                alert('File size cannot exceed ' + 4500000 + ' bytes.\n' + 'Selected file size: ' + file.size);
                return;
            }
        
        	var fr = new FileReader();
            
            fr.onload = function() {
                var fileContents = fr.result;
                var base64Mark = 'base64,';
                var dataStart = fileContents.indexOf(base64Mark) + base64Mark.length;
                fileContents = fileContents.substring(dataStart);
                helper.upload(cmp, file, fileContents);
            };

        	fr.readAsDataURL(file);
            
        }catch(err){
            console.log(err.message);
        }
    },
    
	waiting: function(component, event, helper) {
    	$A.util.addClass(component.find("uploading").getElement(), "uploading");
    	$A.util.removeClass(component.find("uploading").getElement(), "notUploading");
    },
    
    doneWaiting: function(component, event, helper) {
    	$A.util.removeClass(component.find("uploading").getElement(), "uploading");
    	$A.util.addClass(component.find("uploading").getElement(), "notUploading");
    }    
    
})