({
    doInit: function(cmp,evt,helper) {
        helper.getContries(cmp);
    },
    
    CallContryLink:function(cmp,evt,helper){
        var idx = evt.target.id;
        var contries = cmp.get('v.ListContry');
        for(var i=0;i<contries.length;i++){
            if(contries[i].key==idx){
                cmp.set("v.ContrySelectedName",contries[i].value);
                cmp.set("v.ContrySelectedId",contries[i].key);
                helper.getBrandsOfContry(cmp);
                break;
            }; 
        }
    },
    
    CallBrandLink:function(cmp,evt,helper){
        var idx = evt.target.id;
        var brands = cmp.get('v.ListBrand');
        for(var i=0;i<brands.length;i++){
            if(brands[i].key==idx){
                cmp.set("v.BrandSelectedId",brands[i].key);
                helper.CallComunity(cmp);
                break;
            }; 
        }
    },
    
    translate: function(component,evt,helper){
        var ListLabel = helper.GetAllElementsClassTranslate(component);
        helper.Translate(component,ListLabel);
	},
    
    rerender : function(cmp,evt,helper){
        this.superRerender();
    },
    
    render : function(cmp, helper) {
        var ret = this.superRender();
        return ret;
    },
    
})