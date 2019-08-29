HTMLWidgets.widget({

  name: 'slickR',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {
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

                if(link[i]&&objType=='img'){
                  
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

        if(x[0].obj){
               for(j=0;j<x.length;j++){
                  if(x[j].dotObj) var dotObj=x[j].dotObj;
                  $("."+x[j].divName).detach();

                  buildDiv(
                    x[j].obj,
                    x[j].divType,
                    x[j].divName,
                    x[j].links,
                    x[j].padding,
                    height+'px');
                  
                  $("."+x[j].divName).slick(x[j].slickOpts);
               
                  thisDiv = $("."+x[j].divName);

                    $("."+x[j].divName).on('click','.slick-slide', function(e){

                      centerIdx = ($('.slick-slider').slick('slickCurrentSlide') + 1 );
                      clickIdx = ($(this).data('slickIndex') + 1 );
                      totIdx = $('.slick-slider').slick("getSlick").slideCount;
                      
                      absclickIdx = clickIdx;
                      
                      //Reset the clicked index from relative to absolute
                      if( clickIdx > totIdx) absclickIdx = clickIdx - totIdx;
                      if( clickIdx < 1 ) absclickIdx = totIdx + clickIdx;

                      if(typeof(Shiny) !== "undefined"){
                        Shiny.onInputChange(el.id + "_current",{
                          ".clicked": absclickIdx,
                          ".relative_clicked": clickIdx,
                          ".center": centerIdx,
                          ".total": totIdx,
                          ".slider_index": $(thisDiv).attr('class').split(' ')[0]
                        });
                      }
                    });
                  
                }
            }
            
  

          },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});