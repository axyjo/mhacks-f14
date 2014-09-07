//= require jquery
//= require_tree ./welcome

function pageInView() {
    var a = $(window).scrollTop(),
        b = a + $(window).height();
    $(".page").each(function() {
        page1 = $(this).offset().top + $(this).height() / 4, 
        page2 = $(this).offset().top + $(this).height() / 1.3, 
        b >= page1 && page2 >= a ? 
        $(this).removeClass("nonview").addClass("view") : 
        $(this).hasClass("view") && 
        $(this).removeClass("view").addClass("nonview")
    })}
window.Modernizr = function(a, b, c) {},
$(window).scroll(function() {
    pageInView()
});
