({    
    
    getContries:function(cmp){
        
        var action,method,parameters;
        
		//Set method of controller
        method = "c.getContries"; 
        
        //Set parameters of method 
        parameters = {};
        parameters.language = $A.get("$Locale.langLocale");
        
        //Set method and parameters for action
        action = cmp.get(method);
        action.setParams(parameters);
        
        //Set Callback Function
        action.setCallback(this, function(response) {
            var state = response.getState();
           
            if (state === "SUCCESS") {
                cmp.set("v.ListContry",JSON.parse(response.getReturnValue()));
                this.getLabelsView(cmp);
            }else{
                this.responseError(response);
            }
        });
        
        //Call Ajax(enqueueAction) Function
        $A.enqueueAction(action);
        
    },
    
    getLabelsView:function(cmp){
     
        var action,method,parameters,self;
        
        //Set method of controller
        method = "c.getLabelsView"; 
        
        //Set parameters of method 
        parameters = {};
        parameters.language = $A.get("$Locale.langLocale");
        parameters.AGP = 'Header';
        
        //Set method and parameters for action
        action = cmp.get(method);
        action.setParams(parameters);
      	
        //Set Callback Function
        action.setCallback(this, function(response) {
            var state = response.getState();
           
            if (state === "SUCCESS") {
                var ListLabels =  JSON.parse(response.getReturnValue());
                this.toogleSpiner(cmp);
                this.setAttributes(cmp,ListLabels);
            }else{
                this.responseError(response);
            }
            
        });
              
        //Call Ajax(enqueueAction) Function 
        $A.enqueueAction(action);
    },
    
    setAttributes:function(cmp,ListLabels){
        for(var i=0;i<ListLabels.length;i++){
            var attribute = "v."+ListLabels[i].key;
            cmp.set(attribute,ListLabels[i].value);
        }
    },
    
    getBrandsOfContry:function(cmp){
        
        var action,method,parameters;
        
        //Set method of controller
        method = "c.getBrandsOfContry";
        
        //Set parameters of method 
        parameters = {};
        parameters.language = $A.get("$Locale.langLocale");
        parameters.ContryId = cmp.get("v.ContrySelectedId");
        
        //Set method and parameters for action
        action = cmp.get(method);
        action.setParams(parameters);
        
        //Call spiner image loading salesforce
        this.toogleSpiner(cmp);
      	
        //Set Callback Function
        action.setCallback(this, function(response) {
            var state = response.getState();
           
            if (state === "SUCCESS") {
                
                var ListBrand =  JSON.parse(response.getReturnValue());
                cmp.set("v.ListBrand",ListBrand);
                
                this.getLabelsView(cmp);
            }else{
                this.responseError(response);
            }
            
        });
            
        //Call Ajax(enqueueAction) Function 
        $A.enqueueAction(action);
        
    },
    
    toogleSpiner:function(cmp){
        var spinner = cmp.find("spinnerLoad");
        $A.util.toggleClass(spinner, "slds-hide");
    },
    
    CallComunity:function(cmp){
        
        var action,method,parameters;
        
        //Set method of controller
        method = "c.getBrandCommunity";
        
        //Set parameters of method 
        parameters = {};
        parameters.BrandId = cmp.get("v.BrandSelectedId");
        
        //Set method and parameters for action
        action = cmp.get(method);
        action.setParams(parameters);
        
        //Set Callback Function
        action.setCallback(this, function(response) {
           
            var state = response.getState();
           
            if (state === "SUCCESS") {
                var url =  JSON.parse(response.getReturnValue());
                this.BuildingURLAndCall(cmp,url);
            }else{
               this.responseError(response);
            }
            
        });
        
        //Call Ajax(enqueueAction) Function 
        $A.enqueueAction(action);
	},
    
    BuildingURLAndCall:function(cmp,url){
        
        var language,ContryID,BrandID,url;
        
        //Get Language of Salesforce
    	language = $A.get("$Locale.langLocale");
        //Get ContryID of Component
        ContryID = cmp.get("v.ContrySelectedId");
        //Get BrandID of Component
        BrandID = cmp.get("v.BrandSelectedId");
        
        //Concat language in URL
        url = url +'/#?language='+language;
        //Concat Contry in URL
        url = url +'&contry='+ContryID;
        //Concat Brand in URL
        url = url +'&brand='+BrandID;
        
        //Finally redirect for community
        window.location.replace(url);
        
    },
    
    responseError:function(response){
        
        var errors,state;
        
        state = response.getState();
        
        if (state === "INCOMPLETE") {
            console.log('Não conseguiu completar a requisição');
        } else if (state === "ERROR") {
            errors = response.getError();
            if (errors) {
                if (errors[0] && errors[0].message) {
                    console.log("Error message: " + errors[0].message);
                }
            } else {
                console.log("Unknown error");
            }
        }
    }
})