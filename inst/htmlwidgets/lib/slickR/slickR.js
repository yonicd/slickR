HTMLWidgets.widget({

  name: 'slickR',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

          $('#' + el.id).css({
              "margin":"auto"
          });

          if(typeof(Shiny) !== "undefined"){
            
            destroyDiv(x[0]);
            
          }
          
          for(j=0;j<x.length;j++){
                 
                  buildDiv(
                    x[j].obj,
                    x[j].divType,
                    x[j].divName,
                    x[j].links,
                    x[j].padding,
                    x[j].slideh+'px');
                  
                  thisDiv = $("."+x[j].divName);
                  
                  thisDiv.slick(x[j].slickOpts);
                  
                  if(typeof(Shiny) !== "undefined"){
                    
                    toshiny(thisDiv);
                    
                  }
                  
                }

          new ResizeSensor($('#' + el.id), function(){ 
            
            var wh = 0;

            var dh = 0;
            
            for(j=0;j<x.length;j++){
              
              wh = wh + x[j].slideh;
            
            }
            
            for(j = 0; j < x.length; j++ ){

              dh = dh + updateCSS(x[j],el);
              
            }
            
            if(!isNaN(dh)){
              wh = wh + dh;
            }
            
            $('#' + el.id).css({
              "height": Math.max(height, wh) + "px"
            });
            
          });

          function updateCSS(x,el){
            
              var this_dh = $('#' + el.id + ' > div.' + x.divName + '.slick-initialized.slick-slider.slick-dotted > ul').outerHeight();

              var this_slick = $('#' + el.id + ' > div.' + x.divName + '.slick-initialized.slick-slider.slick-dotted');
              
              var this_arrow_next = $('#' + el.id + ' > div.' + x.divName + '.slick-initialized.slick-slider.slick-dotted > button.slick-next.slick-arrow');
              
              var this_arrow_prev = $('#' + el.id + ' > div.' + x.divName + '.slick-initialized.slick-slider.slick-dotted > button.slick-prev.slick-arrow');
              
              if(typeof(this_dh) !== "undefined"){
                
              this_slick.css({
                "height": (this_dh + x.slideh) + "px"
              });

              this_arrow_next.css({
                "top": (100 * x.slideh/(2*(this_dh+x.slideh))) + "%"
              });
              
              this_arrow_prev.css({
                "top": (100 * x.slideh/(2*(this_dh+x.slideh))) + "%"
              });
                
              return this_dh;
              
            }
            
          }

          function destroyDiv(x){
            
            var basename = x.divName.replace(/_bump(.*?)$/,'');
            
            var obj = document.querySelectorAll('[class^="' + basename + '"]');
            
            for(j = 0; j < obj.length; j++ ){
              
            $("." + obj[j].classList[0]).detach();
              
            }
            
          }
            
          function buildDiv(obj,objType,cl,link,width,height){
            
            var len = obj.length,i = 0;
            var mainDiv = document.createElement("div");
            mainDiv.className = cl;
            el.appendChild(mainDiv);
            
            for(i=0; i < len; i++ ){
              
              var divEl = document.createElement("div");
              var newEl = document.createElement(objType);
              
              newEl.style.height=height;

              newEl.style.marginLeft='auto';
              newEl.style.marginRight='auto';
              
              switch (objType) {
                
                case 'iframe':
                  newEl.src = 'data:text/html;charset=utf-8,' + encodeURI(obj[i]);
                  newEl.style.height=height;
                break;
                
                case 'p':
                  newEl.innerText = obj[i];
                break;
                
                default:
                  newEl.src = obj[i];
              }
              
              newEl.style.width=width;

              if((objType=='img') & (link != null)){

                var pEl = document.createElement("p");
                var aEl = document.createElement("a");
                aEl.href = link[i];
                aEl.target="_blank";
                aEl.appendChild(newEl);
                divEl.appendChild(aEl); 
              
              }else{
                
               divEl.appendChild(newEl); 
               
              }
              
              mainDiv.appendChild(divEl);
            }
            return mainDiv;
          }
          
          function toshiny(thisDiv){
                toshiny_arrow(thisDiv);
                toshiny_slider(thisDiv);
              }
              
          function toshiny_arrow(thisDiv){
                thisDiv.on("afterChange",function(event, slick, currentSlide, nextSlide){
                  
                      totIdx    = thisDiv.slick("getSlick").slideCount;
                      centerIdx = thisDiv.slick('slickCurrentSlide') + 1 ;
                      sliderId  = $(thisDiv).attr('class').split(' ')[0];
                      
                      Shiny.onInputChange(el.id + "_current",{

                          ".center"  : centerIdx,
                          ".total"   : totIdx,
                          ".slider"  : sliderId
                          
                      });
                      
                });
              }
              
          function toshiny_slider(thisDiv){
                
                    thisDiv.on('click','.slick-slide', function(e){
                      centerIdx = thisDiv.slick('slickCurrentSlide') + 1 ;
                      clickIdx  = $(this).data('slickIndex') + 1 ;
                      totIdx    = thisDiv.slick("getSlick").slideCount;
                      
                      absclickIdx = clickIdx;
                      sliderId  = $(thisDiv).attr('class').split(' ')[0];
                      
                      //Reset the clicked index from relative to absolute
                      if( clickIdx > totIdx) absclickIdx = clickIdx - totIdx;
                      if( clickIdx < 1 ) absclickIdx = totIdx + clickIdx;

                      Shiny.onInputChange(el.id + "_current",{
                          ".center"           : centerIdx,
                          ".total"            : totIdx,
                          ".slider"           : sliderId,
                          
                          ".clicked"          : absclickIdx,
                          ".relative_clicked" : clickIdx
                      });
                      
                  });
              }
          
          },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});