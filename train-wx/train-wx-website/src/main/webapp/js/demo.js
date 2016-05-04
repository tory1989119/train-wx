$(function(){
    showMark();
});
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

//2016-3-23点击条目出现弹出层显示对应内容，以data-属性为查找器
function showMark(){
            var btnShowMark =$("a[data-showmarkbox]");
            var markBoxLi =$("#markBox div[data-showmarkbox]");
            btnShowMark.each(function(){
                           $(this).click(function(){
                     var thisData =$(this).data("showmarkbox");
                     for(var i=0;i<markBoxLi.length;i++){
                        $(markBoxLi[i]).hide();
                                 var markBoxLiData =$(markBoxLi[i]).data("showmarkbox");
                                 if(thisData==markBoxLiData){
                                                                $(markBoxLi[i]).data("showmarkbox",markBoxLiData).show();
                                                                $(markBoxLi[i]).data("showmarkbox",markBoxLiData).parents("#markBox").show();
                                                   }
                                        }
        });
            });
}

$("div[data-showmarkbox=selectAdress]").find(".btn_c").each(function(){
    $(this).click(function(){
        $(this).addClass("on");
        var otherBtnC=$(this).parent("li").siblings('li').children('.btn_c');
        if(otherBtnC.hasClass('on')){
            otherBtnC.removeClass('on');
        }
        $("#markBox").hide(200);
    });
});