({	    
    	getIpAddress:function(cmp){
        
        var action,method,parameters;
        
		//Set method of controller
        method = "c.getIpAddress"; 
        
        //Set parameters of method 
        parameters = {};        
        
        //Set method and parameters for action
        action = cmp.get(method);
        action.setParams(parameters);
        
        //Set Callback Function
        action.setCallback(this, function(response) {
            var state = response.getState();
           
            if (state === "SUCCESS") {                
                console.log(JSON.parse(response.getReturnValue()));
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
    }
})