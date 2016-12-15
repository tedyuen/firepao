/**
 * Created by tedyuen on 15/2/11.
 */
define(function(require) {

    var curStep;


    var IndexView = Backbone.View.extend({
        el: '#index',
        initialize: function () {
            var self = this;
        },

        events: {
            'touchstart #btn-1': 'onBtn1',
            'touchstart #btn-2': 'onBtn2'
        },

        onBtn1:function(e){
            e.preventDefault();
            var obj = $(e.currentTarget);
            obj.animo( { animation: 'tada' } );
            this.doQuitAnim(1);

        },
        onBtn2:function(e){
            e.preventDefault();
            var obj = $(e.currentTarget);
            obj.animo( { animation: 'tada' } );
            this.doQuitAnim(2);
        },

        doQuitAnim:function(flag) {
            if (flag == 1) {
                $('#anim-id').animo({animation: "fadeOutUp", duration: 0.6, keep: true});
                $('#bottom-text').animo({animation: "fadeOutDown", duration: 0.6, keep: true});
                $('#btn-2').animo({animation: "fadeOutDown", duration: 0.6, keep: true}, function() {
                    $('#btn-1').animo({animation: "fadeOutRight", duration: 0.2, keep: true}, function() {
                        app_router.navigate('!index_11/2', {trigger: true});
                    });
                });
            }else if (flag == 2) {
                $('#bottom-text').animo({animation: "fadeOutDown", duration: 0.6, keep: true});
                $('#btn-1').animo({animation: "fadeOutLeft", duration: 0.6, keep: true}, function() {
                    $('#btn-2').animo({animation: "fadeOutDown", duration: 0.2, keep: true}, function() {
                        app_router.navigate('!index_21/3', {trigger: true});
                    });
                });
            }


        }



    });


    var indexView = new IndexView();

    return {
        init: function(step) {
            curStep = step;

        }
    };
});