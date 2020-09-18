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
          
            x.forEach(function(val){
                var wrapper = document.createElement('div');
                wrapper.innerHTML = val.obj; 
                var divObj = wrapper.firstChild;
                
                var mainDiv = document.createElement("div");
                mainDiv.appendChild(divObj);
                
                el.appendChild(mainDiv);
                thisDiv = $("." + val.divName);

                thisDiv.slick(val.slickOpts);
            });
          
          if(typeof(Shiny) !== "undefined"){
                    
            toshiny(thisDiv);
                    
          }

          /*
          x.forEach(function(val){
            
                  buildDiv(
                    val.obj,
                    val.divType,
                    val.divName,
                    val.links,
                    val.padding,
                    val.slideh+'px');
                  
                  thisDiv = $("." + val.divName);
                  

          });
          */
        // Creates a callback for the el.id to update the height of the widget
        
          new ResizeSensor($('#' + el.id), function(){ 

            var wh = 0;
            
              /* 
              
              new height of widget: 
                - slick input height
                - slick dots height
              
              */
            
            x.forEach(function(val){
              wh = wh + val.slideh + updateDots(val,el);
            });


            $('#' + el.id).css({
              "height": wh + "px"
            });
            
            
          });
          
          function updateDots(x,el){
            
          /* 
          updates the CSS 
            - slick height to include the dots list height + dots bottom margin
            - realigns the top percent of the arrows when there are dots
          */
            
              //var obj = el.id + ' > div.' + x.divName + '.slick-initialized.slick-slider.slick-dotted';
              
              var obj = el.id +  '> div:nth-child(1)';
              
              var this_dh = $('#' + obj + ' > div > ul').outerHeight(true);

              if(typeof(this_dh) === "undefined"){
                
                return 0;
                
              }

              var dots_margin = parseFloat($('#' + obj).css('margin-bottom'));

              this_dh = this_dh + dots_margin;
              
              var this_slick = $('#' + obj);
              
              var this_arrow_next = $('#' + obj + ' > button.slick-next.slick-arrow');
              
              var this_arrow_prev = $('#' + obj + ' > button.slick-prev.slick-arrow');

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
            
            
            obj.forEach(function(val){
              $("." + val.classList[0]).detach();
            });
            
          }
            
          function buildDiv(obj,objType,cl,link,width,height){
            
            var mainDiv = document.createElement("div");
            mainDiv.className = cl;
            el.appendChild(mainDiv);
            
            for(i=0; i < obj.length; i++ ){
              
              var divEl = document.createElement("div");
              var newEl = document.createElement(objType);
              
              newEl.style.height=height;

              newEl.style.marginLeft='auto';
              newEl.style.marginRight='auto';
              
              switch (objType) {
                
                case 'iframe':
                  newEl.srcdoc = obj[i];
                  newEl.style.height=height;
                break;
                
                case 'p':
                  newEl.innerText = obj[i];
                break;
                
                default:
                  newEl.src = obj[i];
              }

              newEl.style.width = width;

              if(link != null){

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