// $.noConflict();
$(function(){
	// dropdown in leftmenu
	$('.leftmenu .dropdown > a').click(function(){
		if(!$(this).next().is(':visible'))
			$(this).next().slideDown('fast');
		else
			$(this).next().slideUp('fast');	
		return false;
	});
	
	if($.uniform) 
	   $('input:checkbox, input:radio, .uniform-file').uniform();
		
	if($('.widgettitle .close').length > 0) {
		  $('.widgettitle .close').click(function(){
					 $(this).parents('.widgetbox').fadeOut(function(){
								$(this).remove();
					 });
		  });
	}
	
	
   // add menu bar for phones and tablet
   $('<div class="topbar"><a class="barmenu">'+
		    '</a></div>').insertBefore('.mainwrapper');
	
	$('.topbar .barmenu').click(function() {
		  
		  var lwidth = '260px';
		  if($(window).width() < 340) {
					 lwidth = '240px';
		  }
		  
		  if(!$(this).hasClass('open')) {
					 $('.rightpanel, .headerinner, .topbar').css({marginLeft: lwidth},'fast');
					 $('.logo, .leftpanel').css({marginLeft: 0},'fast');
					 $(this).addClass('open');
		  } else {
					 $('.rightpanel, .headerinner, .topbar').css({marginLeft: 0},'fast');
					 $('.logo, .leftpanel').css({marginLeft: '-'+lwidth},'fast');
					 $(this).removeClass('open');
		  }
	});
	
	// show/hide left menu
	$(window).resize(function(){
		  if(!$('.topbar').is(':visible')) {
		         $('.rightpanel, .headerinner').css({marginLeft: '260px'});
					$('.logo, .leftpanel').css({marginLeft: 0});
		  } else {
		         $('.rightpanel, .headerinner').css({marginLeft: 0});
					$('.logo, .leftpanel').css({marginLeft: '-260px'});
		  }
   });
	
	// dropdown menu for profile image
	$('.userloggedinfo img').click(function(){
		  if($(window).width() < 480) {
					 var dm = $('.userloggedinfo .userinfo');
					 if(dm.is(':visible')) {
								dm.hide();
					 } else {
								dm.show();
					 }
		  }
   });
	
	// change skin color
	$('.skin-color a').click(function(){ return false; });
	$('.skin-color a').hover(function(){
		var s = $(this).attr('href');
		if($('#skinstyle').length > 0) {
			if(s!='default') {
				$('#skinstyle').attr('href','css/style.'+s+'.css');	
				$.cookie('skin-color', s, { path: '/' });
			} else {
				$('#skinstyle').remove();
				$.cookie("skin-color", '', { path: '/' });
			}
		} else {
			if(s!='default') {
				$('head').append('<link id="skinstyle" rel="stylesheet" href="css/style.'+s+'.css" type="text/css" />');
				$.cookie("skin-color", s, { path: '/' });
			}
		}
		return false;
	});
	
	// load selected skin color from cookie
	if($.cookie('skin-color')) {
		var c = $.cookie('skin-color');
		if(c) {
			$('head').append('<link id="skinstyle" rel="stylesheet" href="css/style.'+c+'.css" type="text/css" />');
			$.cookie("skin-color", c, { path: '/' });
		}
	}
	
	
	// expand/collapse boxes
	if($('.minimize').length > 0) {
		  
		  $('.minimize').click(function(){
					 if(!$(this).hasClass('collapsed')) {
								$(this).addClass('collapsed');
								$(this).html("&#43;");
								$(this).parents('.widgetbox')
										      .css({marginBottom: '20px'})
												.find('.widgetcontent')
												.hide();
					 } else {
								$(this).removeClass('collapsed');
								$(this).html("&#8211;");
								$(this).parents('.widgetbox')
										      .css({marginBottom: '0'})
												.find('.widgetcontent')
												.show();
					 }
					 return false;
		  });
			  
	}
	
});