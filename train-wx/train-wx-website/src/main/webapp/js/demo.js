//公告滚动
/*var ew = $('#e').width();
//$('#d').width(ew*2);
$('#d').append($('#e').clone());
function scroll_left(){
    var left = $('#c').scrollLeft();

    if(left < ew){
        left ++;
    }else{
        left = 0;
    }
   $('#c').scrollTop($('#c').scrollTop());
    $('#c').scrollLeft(left);
}
var timer = setInterval(scroll_left,30);*/
//点赞数字加减
$("[data-addnum]").each(function(){
    $(this).click(function(){
        var num = parseInt($(this).html()); 
        if($(this).attr('addflag')==1){//已加过，要减！
            if(num > 1){
                    $(this).html(num-1); 
            }
            $(this).attr({
                'addflag': '0'
            });
        }else{
            $(this).html(num+1);
            $(this).attr({
                'addflag': '1'
            });
        }

    });
});