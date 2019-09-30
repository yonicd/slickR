library(texPreview)

testthat::context('utility functions of package')

 #testthat::skip_on_cran()

testthat::describe('build usepackage call',{
 
  it('basic call', {
      testthat::expect_equal(texPreview:::build_usepackage(pkg = 'xcolor'),"\\usepackage{xcolor}")
    })
  
  it('check library is installed', {
      testthat::expect_equal(texPreview:::build_usepackage(pkg = 'xcolor',chk.inst = TRUE),"\\usepackage{xcolor}")
    })
  
  it('add options', {
      testthat::expect_equal(texPreview:::build_usepackage(pkg = 'xcolor',options = 'usenames'),"\\usepackage[usenames]{xcolor}")
    })
   
  it('use bad library name', {
      testthat::expect_warning(texPreview:::build_usepackage(pkg = 'nopack',chk.inst = TRUE))
    })
  
})

testthat::describe('build usepackage multiple calls',{
  
  geom.opts <- c('paperwidth=35cm','paperheight=35cm','left=2.5cm','top=2.5cm')
  
  use.opts <- "\\usetikzlibrary{mindmap,backgrounds}"
  
  l <- mapply(texPreview:::build_usepackage,
    pkg =        list('times','geometry','tikz'),
    options=     list(NULL   ,geom.opts ,NULL),
    uselibrary = list(NULL   ,NULL      ,use.opts)
  )
  
  it('class', {
      testthat::expect_is(l,'list')
    })
  
  it('dimension', {
      testthat::expect_equal(length(l),3)
    })
  
})

testthat::describe('find packages',{
  
  skip_on_windows()
  
  if(length(system('tlmgr --version',intern = TRUE))>0){
    
    x <- head(get_texpackages())
    
  it('check class', {
      testthat::expect_is(x,'character')
      testthat::expect_true(length(x)>0)    
  })
    
  }else{
    
    it('fake test', {
      testthat::expect_true(2+2==4)
    })
    
  }
  
})

testthat::describe('empty call to addin',{

    it('cause addin to crash', {
      testthat::expect_error(texPreview:::tex_addin())
    })
})
