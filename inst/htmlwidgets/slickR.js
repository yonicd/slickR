HTMLWidgets.widget({

  name: 'slickR',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {
            function buildDiv(images,cl,width){
              var len = images.length,i = 0;
							var mainDiv = document.createElement("div");
              mainDiv.className = cl;
              document.body.appendChild(mainDiv);
              
              for(i=0; i < len; i++ ){
                var img = document.createElement("img");
                img.src = images[i];
                img.style.width=width;
                var divEl = document.createElement("div");
                divEl.appendChild(img);
                mainDiv.appendChild(divEl);
              }
              return mainDiv;
}


        if(x[0].images){
               for(j=0;j<x.length;j++){
                  if(x[j].dotImages) var dotImages=x[j].dotImages;
                  buildDiv(x[j].images,x[j].divName,75/x.length+'%');
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