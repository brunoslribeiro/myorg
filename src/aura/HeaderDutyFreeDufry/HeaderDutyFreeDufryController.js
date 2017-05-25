({
    doInit: function(cmp,evt,helper) {

       helper.getBrands(cmp);
       
    },
    
    CallBrandLink:function(cmp,evt,helper){
        var idx = evt.target.id;
        window.location.replace("https://comunidade1-developer-edition.na35.force.com/comunidade2/s/");
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