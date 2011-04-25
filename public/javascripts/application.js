
$(function() {
    $( ".datepicker" ).datepicker({ dateFormat: 'yy-mm-dd' });

    $(".destination").blur(function(){
        var $this = $(this);
        var destinationName = $this.val();
    })
});