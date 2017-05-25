({
	 doInit : function(cmp) {
         
         console.log('Vitrine Fui chamado');
         
        $A.createComponent(
            "c:ComponenteLoja",
            {
                "isHaveLoja": "true"
            },
            function(component, status, errorMessage){
                //Add the new button to the body array
                if (status === "SUCCESS") {
                    var body = cmp.get("v.body");
                    body.push(component);
                    cmp.set("v.body", body);
                }
                else if (status === "INCOMPLETE") {
                    console.log("No response from server or client is offline.")
                    // Show offline error
                }
                else if (status === "ERROR") {
                    console.log("Error: " + errorMessage);
                    // Show error message
                }
            }
        );
    },
    
    OtherComponent: function(cmp){
    	 cmp.set("v.body", "");
	}
    
})