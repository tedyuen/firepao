//导航模块定义
define(function(require, exports) {
    // 计算是否是第一次进入首页  
    var isFirst = 1;
       
    return {
    	init: function(step, title) {
            var hash = location.hash;

    		if ((step == '') || hash.match('index_00')) {
                if (isFirst != 1) {
                    $('#container').children().fadeOut(0, function () {
                        $('#container #index').fadeIn(0);
                    });
                }
                isFirst += 1;
    		} else if (hash.match('index_11')) {
                $('#container').children().fadeOut(0, function() {
                    $('#container #index-11').fadeIn(0);
                });

            } else if (hash.match('index_21')) {
                $('#container').children().fadeOut(0, function() {
                    $('#container #index-21').fadeIn(0);
                });

            }
        }
    };
});