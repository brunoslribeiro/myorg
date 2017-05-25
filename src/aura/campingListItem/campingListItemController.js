({
	packItem : function(component, event, helper) {
		//Pego item maior
		var e = component.get("v.item",true);
        a.Packed__c = true;
        component.set("v.item",a);
        
        //Pego o botão clicado
        btnbutton = event.getSource();
		component.set("v.Packed__c",true);     
		btnbutton.set("v.disabled",true);
	}
})