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

        if(x.images){
          
                if(!x.divName){
                  buildDiv(x.images,'baseDiv','75%');
                  $(".baseDiv").slick({
                    dots: true
                  });
                } else {
                       buildDiv(x.images,x.divName[0],x.imgWidth[0]);
                      buildDiv(x.images,x.divName[1],x.imgWidth[1]);

                $("."+x.divName[0]).slick({
                  slidesToShow: 2,
                  slidesToScroll: 1,
                  initialSlide: 0,
                  arrows: false,
                  fade: true,
                  adaptiveHeight: true,
                  asNavFor: "."+x.divName[1]
                });
                
                $("."+x.divName[1]).slick({
                  slidesToShow: 4,
                  slidesToScroll: 1,
                  asNavFor: "."+x.divName[0],
                  centerMode: true,
                  focusOnSelect: true
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