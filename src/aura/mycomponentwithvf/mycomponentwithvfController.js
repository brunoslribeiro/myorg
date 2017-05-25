({
    doInit : function(component) {
        var vfOrigin = "https://" + component.get("v.vfHost");
        window.addEventListener("message", function(event) {
            
            if (event.origin !== vfOrigin) {
                // Not the expected origin: Reject the message!
                console.log('problem origin');
                return;
            }
            if(event.data!=null){
             document.getElementById('Enviar').style.display='block';   
            }            
        }, false);               
    }

})