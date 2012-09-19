$(document).ready(function(e) {
    $('.btn-create-comment').click(function(){		
			$(this).parent('form').submit();
		}
	);
	
	$('#pages-menu li').mouseenter(function(){
		$(this).children('ul').slideDown("fast");	
	});
	$('#pages-menu').mouseleave(function(){
		$('.sub-pages-menu').slideUp("fast");	
	});
	
	$('#tabs').tabs();
});