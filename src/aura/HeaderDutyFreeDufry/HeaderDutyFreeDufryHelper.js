({    
    getBrands:function(cmp){
        console.log('getBrands');
        
        var cmpself = cmp;
        
        var action = cmp.get("c.getBrands");
        action.setParams({});
      
        action.setCallback(this, function(response) {
            var state = response.getState();
           
            if (state === "SUCCESS") {
                
                var ListBrands =  JSON.parse(response.getReturnValue());                
                cmp.set("v.ListBrand",ListBrands);
                this.InitTranslate(cmp);
                
            }
            else if (state === "INCOMPLETE") {
                console.log('Não conseguiu completar a requisição');
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                 errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
               
       $A.enqueueAction(action);
     
	},
    
    InitTranslate:function(cmp){
         var ListLabel = this.GetAllElementsClassTranslate(cmp);
         
          var action = cmp.get("c.getTraslanteKeyName");
            action.setParams({ jsonlabels : JSON.stringify(ListLabel)});
          
            action.setCallback(this, function(response) {
                var state = response.getState();
               
                if (state === "SUCCESS") {
                    console.log(response.getReturnValue());
                    this.SetAllElementsClassTranslate(response.getReturnValue());
                }
                else if (state === "INCOMPLETE") {
                    console.log('Não conseguiu completar a requisição');
                }
                else if (state === "ERROR") {
                    var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " + 
                                     errors[0].message);
                        }
                    } else {
                        console.log("Unknown error");
                    }
                }
            });
                   
          $A.enqueueAction(action);
        
    },
    
    Translate:function(cmp,ListLabel){
        
        var action = cmp.get("c.getTraslanteKeyName");
        action.setParams({ jsonlabels : JSON.stringify(ListLabel)});
      
        action.setCallback(this, function(response) {
            var state = response.getState();
           
            if (state === "SUCCESS") {
                alert("From server: " + response.getReturnValue());
                console.log(response.getReturnValue());
                this.SetAllElementsClassTranslate(response.getReturnValue());
            }
            else if (state === "INCOMPLETE") {
                console.log('Não conseguiu completar a requisição');
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                 errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
               
       return action;
     
	},
    
    GetAllElementsClassTranslate:function(cmp){
    	

    	var ListDocuments = document.getElementsByClassName('translation');
       
        var ListLabel = [];
        
        for(var i=0;i<ListDocuments.length;i++){
           var label = {};
           label.Key = ListDocuments[i].innerText;
           label.Language = $A.get("$Locale.langLocale");
           label.Value = '';
           ListLabel.push(label);
        }
    	
		return ListLabel;
	},
    
    SetAllElementsClassTranslate:function(ListLabel){
         try {
        	var ListLabel = JSON.parse(ListLabel);
        	var ListDocuments = document.getElementsByClassName('translation');
        	var KeyLabelText='';
       
       	 	TransformListLabel = this.TransformLabelValue(ListLabel);
        
            for(var i=0;i<ListDocuments.length;i++){
              this.ChangeElementValueInInnerText(ListDocuments[i],TransformListLabel);
            } 
             
         }catch(err) {
          console.log(err.message);
       }              
           
     },
    
    ChangeElementValueInInnerText:function(Element,ListLabels){
        
        var hasElement=false;
        var hasinnerText=false;
        var hasInListLabels=false;
        var hasValue = false;
        var isSpan = false;
        var Message = [];
        var vaValue;
        
        console.log(ListLabels);
        
        hasElement = typeof Element != "undefined" ? true: false;
        isSpan = hasElement && Element.nodeName.toLowerCase() == "span" ?  true:false;
        hasinnerText = isSpan && typeof(Element.innerText)!= "undefined" ? true:false;
        hasInListLabels = hasinnerText && typeof ListLabels[Element.innerText] != "undefined"? true:false;
        hasValue =  hasInListLabels && ListLabels[Element.innerText] != "" ? true:false;
        
        if(hasElement && isSpan && hasinnerText && hasInListLabels && hasValue){
            Element.innerText = TransformListLabel[Element.innerText];
        }
        
        if(!hasElement){
            console.log('Element not found');
        }
        
        if(!isSpan){
            console.log('This element is not span!');
            console.log(Element);
        }
        
        if(!hasinnerText){
            console.log('This element not found InnerText!');
            console.log(Element);
        }
        
        if(!hasInListLabels){
            console.log('Not Found in Custom Settings Element!');
            console.log(Element);
        }
        
        if(!hasValue){
            console.log('In Custom Settings not found Value for this!');
            console.log(Element);
        }
        
        
    },
    
    TransformLabelValue:function(ListLabel){
        
        if(ListLabel!=null){
            
             try {
                var ArrayListLabel = [];
              
                ListLabel.forEach(function(obj){
                   ArrayListLabel[obj.Key] = obj.Value;
                });
            }
            catch(err) {
                console.log('TransformLabelValue: '+ err.message);
            }  
            
        }
        
		return ArrayListLabel;
	}
    
})