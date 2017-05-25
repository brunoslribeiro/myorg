({
    getRegioes:function(cmp,contry){
        
        var action,method,parameters;
        
        //Set method of controller
        method = "c.getRegioes";
        
        //Set parameters of method 
        parameters = {};
        parameters.ContryID = contry;
      	
        //Set method and parameters for action
        action = cmp.get(method);
        action.setParams(parameters);
        
        //Set Callback Function
        action.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS") {
                cmp.set("v.ListRegions",JSON.parse(response.getReturnValue()));
                this.toogleSpiner(cmp);
            }else {
                this.responseError(response)
            }
        });
        
        //Call Ajax(enqueueAction) Function 
        $A.enqueueAction(action);
    },
    
    getStoresofRegion:function(cmp,RegionID){
       
        var action,method,parameters;
        
        //Set method of controller
        method = "c.getStoresOfBrandAndRegion";
        
        //Set parameters of method 
        parameters = {};
        parameters.RegionID = RegionID;
        parameters.BrandID = cmp.get("v.BrandId");
		
        //Set method and parameters for action
        action = cmp.get(method);
        action.setParams(parameters);
        
         //Call spiner image loading salesforce
        this.toogleSpiner(cmp);
        
        //Set Callback Function
        action.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS") {
                cmp.set("v.ListStores",JSON.parse(response.getReturnValue()));
                 this.toogleSpiner(cmp);
            }else{
                this.responseError(response);
            }
            
        });
		
		//Call Ajax(enqueueAction) Function     
        $A.enqueueAction(action);
        
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
    },
    
    toogleSpiner:function(cmp){
        var spinner = cmp.find("spinnerLoad");
        $A.util.toggleClass(spinner, "slds-hide");
    },
    
    getURLParameter:function(cmp,name){
       return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.hash) || [null, ''])[1].replace(/\+/g, '%20')) || null;
	}
    
})