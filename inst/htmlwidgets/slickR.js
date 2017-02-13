HTMLWidgets.widget({

  name: 'slickR',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {
            
            if(x.images){
              function buildDiv(x,cl,width){
							var mainDiv = document.createElement("div");
              mainDiv.className = cl;
              document.body.appendChild(mainDiv);
               var len = x.images.length,i = 0;
               
              for(i=0; i < len; i++ ){
                var img = document.createElement("img");
                img.src = x.images[i];
                img.style.width=width;
                var divEl = document.createElement("div");
                divEl.appendChild(img);
                mainDiv.appendChild(divEl);
              }
              return mainDiv;
}
        
        buildDiv(x,'slider-for','50%');
        buildDiv(x,'slider-nav','10%');

                $('.slider-for').slick({
                  slidesToShow: 2,
                  slidesToScroll: 1,
                  initialSlide: 0,
                  arrows: false,
                  fade: true,
                  adaptiveHeight: true,
                  asNavFor: '.slider-nav'
                });
                
                $('.slider-nav').slick({
                  slidesToShow: 4,
                  slidesToScroll: 1,
                  asNavFor: '.slider-for',
                  centerMode: true,
                  focusOnSelect: true
                });
            }
          },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});