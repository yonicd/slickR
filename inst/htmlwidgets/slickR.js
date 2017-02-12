HTMLWidgets.widget({

  name: 'slickR',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {
            
              var len = x.images.length,i = 0;
              var parentDiv = document.createElement("div");
              parentDiv.className = "slider-nav";
              
              for(; i < len; i++ ){
                var img = document.createElement("img");
                img.src = x.images[i];
                img.width="50%";
                var divEl = document.createElement("div");
                divEl.appendChild(img);
                parentDiv.appendChild(divEl);
              }
              
              $('.slider-nav').slick();
            
          },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});