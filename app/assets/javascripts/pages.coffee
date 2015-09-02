# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

var mobile = false;
// Foundation JavaScript
// Documentation can be found at: http://foundation.zurb.com/docs


function show_current_lama()
{
  jQuery('.current-menu-item').css('background-position', '13px 0px');
}

function photo_flash()
{
  jQuery('#photographer').addClass('flash');
  jQuery('#flash').css('display','block').animate({ opacity: 0 },2000, function(){
    jQuery('#flash').css({'display': 'none', 'opacity': 1});
    jQuery('#photographer').removeClass('flash');
  })
  
  setTimeout('photo_flash()', 7500); 
}


jQuery(window).resize(function(){
  if(jQuery(window).width()<641)
  {
    mobile=true;
  }else{
    mobile=false;
    if(jQuery('.navigation nav ul li').hasClass('menu-out'))
    {
      jQuery('.navigation nav ul li').removeClass('menu-out').removeAttr('style');
      show_current_lama();
    }
  }
  console.log(mobile);
})

jQuery('ready', function($){
  $(document).foundation();
  
  if(jQuery(window).width()<641)
  {
    mobile=true;
  }
  
  if($('body').hasClass('page-template-page-photo-php'))
  {
    setTimeout('photo_flash()', 2000);
  }
  
  $('#facebook_share').click(function(ev)
  {
    ev.preventDefault();

    
    if(url==''){
      url = document.location.href;
    }   

    // calling the API ...
    var obj = {
      method: 'feed',
      link: url
    };
    
    function callback(){
      register_share('facebook');
    }
    
    FB.ui(obj, callback);
  })
  
    setTimeout('show_current_lama()', 300);
    $('nav ul li').hover(function(){
      if(mobile==false)
      {
        $('nav ul li').removeAttr('style');
        $(this).css('background-position', '13px 0px');
      }
    },
    function(){ 
      if(mobile==false)
      {
        $('nav ul li').removeAttr('style');
        $('.current-menu-item').css('background-position', '13px 0px');
      }
    })
    $('#mobile_menu-toggle').click(function(){
      if(mobile==true)
      {
        if($('.navigation nav ul li').hasClass('menu-out'))
        {
          $('.navigation nav ul li').removeClass('menu-out');
          $('.navigation nav ul li').each(function(el){ 
            if($(this).hasClass('current-menu-item'))
            {
              $(this).removeAttr('style');
            }else{ 
              
              $(this).animate({ marginTop: -100, opacity: 0},300,function(){
                $(this).removeAttr('style')
                
              });
            }
          })
          
        }else{
          $('.navigation nav ul li').addClass('menu-out');
          $('.navigation nav ul li').each(function(el){ 
            if($(this).hasClass('current-menu-item'))
            {
              $(this).removeAttr('style');
            }else{ 
              $(this).css('display','block').animate({ marginTop: 0, opacity: 1},300);
            }
          })
        }
      }
    })
})