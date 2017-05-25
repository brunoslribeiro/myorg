({
    doInit:function(component,event,helper){
        var contry,brand,language;
        
        //GET parameters of url with language,brand,contry
        contry = helper.getURLParameter(component,'contry');
		brand = helper.getURLParameter(component,'brand');
        language = helper.getURLParameter(component,'language');
        
        //SET parameters for view
        component.set("v.ContryId",contry);
        component.set("v.BrandId",brand);
        
        //Call get Regioes for load attribute
        helper.getRegioes(component,contry);
    },
    
    ChangeRegion : function(component,event,helper){
      RegionID = event.target.value;
      helper.getStoresofRegion(component,RegionID);
    },
    
    ShowLoja:function(component,event,helper){
      var lojaselecionada = event.target.value;
      $('#'+lojaselecionada).toggle('slow');
    },

    rerender : function(cmp,event,helper){
        this.superRerender();
    }
    
})