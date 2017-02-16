HTMLWidgets.widget({

  name: 'slickR',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {
            function buildDiv(obj,objType,cl,width){
              var len = obj.length,i = 0;
							var mainDiv = document.createElement("div");
              mainDiv.className = cl;
              document.body.appendChild(mainDiv);
              
              for(i=0; i < len; i++ ){
                var divEl = document.createElement("div");
                var newEl = document.createElement(objType);
                divEl.appendChild(newEl);
                
                switch (objType) {
                  
                  case 'iframe':
                    newEl.src = 'data:text/html;charset=utf-8,' + encodeURI(obj[i]);
                    newEl.style.height='400px';
                  break;
                  
                  default:
                    newEl.src = obj[i];
                
                }
                
                newEl.style.width=width;
                
                mainDiv.appendChild(divEl);
              }
              return mainDiv;
            }

        if(x[0].obj){
               for(j=0;j<x.length;j++){
                  if(x[j].dotObj) var dotObj=x[j].dotObj;
                  buildDiv(x[j].obj,x[j].divType,x[j].divName,75/x.length+'%');
                  $("."+x[j].divName).slick(x[j].slickOpts);
                }
            }
          },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});