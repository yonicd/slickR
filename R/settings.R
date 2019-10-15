#' @title construct slick settings
#' @description Function to construct elements to place in settings
#' @param accessibility logical, Enables tabbing and arrow key navigation, 
#' Default: TRUE
#' @param adaptiveHeight logical, Enables adaptive height for single slide 
#' horizontal carousels., Default: FALSE
#' @param autoplay logical, Enables Autoplay, Default: FALSE
#' @param autoplaySpeed numeric, Autoplay Speed in milliseconds, Default: 3000
#' @param arrows logical, Prev/Next Arrows, Default: TRUE
#' @param asNavFor character, Set the slider to be the navigation of other slider 
#' (Class or ID Name), Default: null
#' @param appendArrows character, Change where the navigation arrows are attached 
#' (Selector, htmlString, Array, Element, jQuery object), Default: $(element)
#' @param appendDots character, Change where the navigation dots are attached 
#' (Selector, htmlString, Array, Element, jQuery object), Default: $(element)
#' @param prevArrow character (html|jQuery selector) | object (DOM node|jQuery object),
#'  Allows you to select a node or customize the HTML for the "Previous" arrow.,
#'   Default: <button type="button" class="slick-prev">Previous</button>
#' @param nextArrow character (html|jQuery selector) | object (DOM node|jQuery object),
#'  Allows you to select a node or customize the HTML for the "Next" arrow., 
#'  Default: <button type="button" class="slick-next">Next</button>
#' @param centerMode logical, Enables centered view with partial prev/next 
#' slides. Use with odd numbered slidesToShow counts., Default: FALSE
#' @param centerPadding character, Side padding when in center mode (px or \%), 
#' Default: '50px'
#' @param cssEase character, CSS3 Animation Easing, Default: 'ease'
#' @param customPaging function, Custom paging templates. See source for use 
#' example., Default: n/a
#' @param dots logical, Show dot indicators, Default: FALSE
#' @param dotsClass character, Class for slide indicator dots container, 
#' Default: 'slick-dots'
#' @param draggable logical, Enable mouse dragging, Default: TRUE
#' @param fade logical, Enable fade, Default: FALSE
#' @param focusOnSelect logical, Enable focus on selected element (click), 
#' Default: FALSE
#' @param easing character, Add easing for jQuery animate. Use with easing 
#' libraries or default easing methods, Default: 'linear'
#' @param edgeFriction numeric, Resistance when swiping edges of 
#' non-infinite carousels, Default: 0.15
#' @param infinite logical, Infinite loop sliding, Default: TRUE
#' @param initialSlide numeric, Slide to start on, Default: 0
#' @param lazyLoad character, Set lazy loading technique. Accepts 'ondemand' or 
#' 'progressive', Default: 'ondemand'
#' @param mobileFirst logical, Responsive settings use mobile first calculation,
#'  Default: FALSE
#' @param pauseOnFocus logical, Pause Autoplay On Focus, Default: TRUE
#' @param pauseOnHover logical, Pause Autoplay On Hover, Default: TRUE
#' @param pauseOnDotsHover logical, Pause Autoplay when a dot is hovered, 
#' Default: FALSE
#' @param respondTo character, Width that responsive object responds to. 
#' Can be 'window', 'slider' or 'min' (the smaller of the two), Default: 'window'
#' @param responsive object, Object containing breakpoints and settings objects 
#' (see demo). Enables settings sets at given screen width. 
#'   Set settings to "unslick" instead of an object to disable slick at a 
#'   given breakpoint., Default: none
#' @param rows numeric, Setting this to more than 1 initializes grid mode. 
#' Use slidesPerRow to set how many slides should be in each row., Default: 1
#' @param slide element, Element query to use as slide, Default: ''
#' @param slidesPerRow numeric, With grid mode intialized via the rows option, 
#' this sets how many slides are in each grid row. dver, Default: 1
#' @param slidesToShow numeric, # of slides to show, Default: 1
#' @param slidesToScroll numeric, # of slides to scroll, Default: 1
#' @param speed numeric, Slide/Fade animation speed in milliseconds, 
#' Default: 300
#' @param swipe logical, Enable swiping, Default: TRUE
#' @param swipeToSlide logical, Allow users to drag or swipe directly to a slide
#'  irrespective of slidesToScroll, Default: FALSE
#' @param touchMove logical, Enable slide motion with touch, Default: TRUE
#' @param touchThreshold numeric, To advance slides, the user must swipe a 
#' length of (1/touchThreshold) * the width of the slider, Default: 5
#' @param useCSS logical, Enable/Disable CSS Transitions, Default: TRUE
#' @param useTransform logical, Enable/Disable CSS Transforms, Default: TRUE
#' @param variableWidth logical, Variable width slides, Default: FALSE
#' @param vertical logical, Vertical slide mode, Default: FALSE
#' @param verticalSwiping logical, Vertical swipe mode, Default: FALSE
#' @param rtl logical, Change the slider's direction to become right-to-left, 
#' Default: FALSE
#' @param waitForAnimate logical, Ignores requests to advance the slide while 
#' animating, Default: TRUE
#' @param zIndex numeric, Set the zIndex values for slides, useful for IE9 and 
#' lower, Default: 1000
#' @param \dots unused
#' @return list of class c('setting','slickR')
#' @details To find further information on the attributes that can be used 
#' please refer to \url{http://kenwheeler.github.io/slick/}.
#' @rdname settings
#' @family settings
#' @export 
settings <- function(accessibility,
                     adaptiveHeight,
                     autoplay     ,
                     autoplaySpeed,
                     arrows       ,
                     asNavFor     ,
                     appendArrows ,
                     appendDots   ,
                     prevArrow    ,
                     nextArrow    ,
                     centerMode   ,
                     centerPadding,
                     cssEase      ,
                     customPaging ,
                     dots         ,
                     dotsClass    ,
                     draggable    ,
                     fade         ,
                     focusOnSelect,
                     easing       ,
                     edgeFriction ,
                     infinite     ,
                     initialSlide ,
                     lazyLoad     ,
                     mobileFirst  ,
                     pauseOnFocus ,
                     pauseOnHover ,
                     pauseOnDotsHover,
                     respondTo    ,
                     responsive   ,
                     rows         ,
                     slide        ,
                     slidesPerRow ,
                     slidesToShow ,
                     slidesToScroll,
                     speed        ,
                     swipe        ,
                     swipeToSlide ,
                     touchMove    ,
                     touchThreshold,
                     useCSS       ,
                     useTransform ,
                     variableWidth,
                     vertical     ,
                     verticalSwiping,
                     rtl          ,
                     waitForAnimate,
                     zIndex,
                     ...){
  
  setting <- find_args(...)
  
  bad_name <- setdiff(names(setting),names(default_class))
  
  if(length(bad_name)>0)
    stop(sprintf('%s not a valid element',paste0(bad_name,collapse = ', ')))
  
  invisible(lapply(names(setting),check_setting,setting))
  
  structure(setting, class = c("setting", "slickR"))
  
}

find_args <- function (...) {
  env <- parent.frame()
  args <- names(formals(sys.function(sys.parent(1))))
  vals <- mget(args, envir = env)
  vals <- vals[!vapply(vals, is_missing_arg, logical(1))]
  utils::modifyList(vals, list(..., ... = NULL))
}

is_missing_arg <- function (x) identical(x, quote(expr = ))

check_setting <- function(e,elements){
  e_val <- elements[[e]]
  if(!inherits(e_val,default_class[e]))
    stop(sprintf('%s must be of class %s',e,default_class[e]))
}

default_class <- c(
  'accessibility'    = 'logical',
  'adaptiveHeight'   = 'logical',
  'autoplay'         = 'logical',
  'arrows'           = 'logical',
  'centerMode'       = 'logical',
  'dots'             = 'logical',
  'draggable'        = 'logical', 
  'fade'             = 'logical', 
  'focusOnSelect'    = 'logical',
  'infinite'         = 'logical',
  'mobileFirst'      = 'logical',
  'pauseOnFocus'     = 'logical',
  'pauseOnHover'     = 'logical',
  'pauseOnDotsHover' = 'logical',
  'swipe'            = 'logical',
  'swipeToSlide'     = 'logical',
  'touchMove'        = 'logical',
  'useCSS'           = 'logical',
  'useTransform'     = 'logical',
  'variableWidth'    = 'logical', 
  'vertical'         = 'logical', 
  'verticalSwiping'  = 'logical', 
  'rtl'              = 'logical', 
  'waitForAnimate'   = 'logical',
  'customPaging'     = 'JS_EVAL',
  'responsive'       = 'JS_EVAL',
  'zIndex'           = 'numeric',
  'edgeFriction'     = 'numeric',
  'initialSlide'     = 'numeric',
  'autoplaySpeed'    = 'numeric',
  'rows'             = 'numeric',
  'slidesPerRow'     = 'numeric',
  'slidesToShow'     = 'numeric',
  'slidesToScroll'   = 'numeric',
  'speed'            = 'numeric',
  'touchThreshold'   = 'numeric',
  'prevArrow'        = 'character',
  'nextArrow'        = 'character',
  'asNavFor'         = 'character',
  'appendArrows'     = 'character',
  'appendDots'       = 'character',
  'centerPadding'    = 'character',
  'cssEase'          = 'character',
  'dotsClass'        = 'character',
  'easing'           = 'character',
  'lazyLoad'         = 'character',
  'respondTo'        = 'character'
)
