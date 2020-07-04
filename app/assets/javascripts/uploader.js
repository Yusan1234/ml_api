$(function(){
    var elements = $('.modal-overlay, .modal');
    
    $('.img_01_show').click(function(){
        elements.addClass('active');
        console.log("aaa")
    });
    
    $('.close-modal').click(function(){
        elements.removeClass('active');
    });
    });