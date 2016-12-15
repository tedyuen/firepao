/**
 * Created by tedyuen on 15/2/11.
 */
define(function(require) {
    var curStep;

    var IndexView = Backbone.View.extend({
        el: '#index-21',

        initialize: function () {
            var self = this;
            require.async('./nav', function(nav) {
                nav.init(curStep);
            });
        },

        events: {
            'click .wish-icon': 'nextWish'
        },

        nextWish:function(e){
            var obj = $(e.currentTarget);
            obj.animo( { animation: 'tada' },function(){//name="+name+"&+"&headurl="+headurl
                location.href = url+"/firepao/static/sub_2.jsp?name="+name+"&flag=1"+"&type="+obj.attr("alt")+"&headurl="+headurl;
            });

        }



    });


    var indexView = new IndexView();

    return {
        init: function(step) {
            curStep = step;
//            indexView.initialize();
        }
    };
});