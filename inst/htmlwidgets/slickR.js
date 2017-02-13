HTMLWidgets.widget({

  name: 'slickR',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {
            
            if(x.images){
              var len = x.images.length,i = 0;
              var mainDiv = document.createElement("div");
              mainDiv.className = "slider-nav";
              document.body.appendChild(mainDiv);
              
              for(i=0; i < len; i++ ){
                var img = document.createElement("img");
                img.src = x.images[i];
                img.style.width='50%';
                var divEl = document.createElement("div");
                divEl.appendChild(img);
                mainDiv.appendChild(divEl);
              }

                $('.slider-nav').slick({
                  dots: true
                });
            }
          },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});