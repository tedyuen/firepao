/**
 * Created by tedyuen on 15/2/11.
 */
define(function(require) {
    var curStep;
    var count = 0;
    var flag = false
    var second = 20;
    var countdown = 3;
    var trigger = true;

    var startTime;
    var currentTime;

    var mptFlag = true;
    var mptTime;
    var maxMpt = 500;

    var IndexView = Backbone.View.extend({
        el: '#index-11',

        initialize: function () {
            var self = this;
            $('#fire-count').html(count);
            $('#time-count').html(countdown);
            require.async('./nav', function(nav) {
                nav.init(curStep);
            });
            setTimeout(function(){
                self.countDown();
            },1000);

        },

        events: {
            'touchstart #click-div': 'doCount',
            'touchstart #click-next': 'goNext'

        },

        playMp3:function(){
            mptTime = new Date().getTime();
            if(mptFlag) {
                mpt.play();
                mptFlag = false;
            }
        },

        doCount:function(e){
            var tempTime = new Date().getTime();
            if(flag && second>((tempTime-startTime)/1000)){
                count++;
                $('#fire-count').html(count);
                this.playMp3();
                if(trigger){
                    $('#fire-img').addClass("fire-img-1");
                    $('#fire-img').removeClass("fire-img-2");
                    trigger = false;
                }else{
                    $('#fire-img').addClass("fire-img-2");
                    $('#fire-img').removeClass("fire-img-1");
                    trigger = true;
                }
            }
        },

        countDown:function(){
            var self = this;
            if(countdown>0){
                countdown = countdown-1;
                $('#time-count').html(countdown);
                setTimeout(function(){
                    self.countDown();
                },1000);
            }else{
                flag = true;
                startTime = new Date().getTime();
                currentTime = startTime;
                $('#time-count').html(second);
                self.countDown2();
            }

        },

        countDown2:function(){
            var self = this;
            currentTime = new Date().getTime();
            if(second>((currentTime-startTime)/1000)){
//                second--;
                var tempSecond = (second-parseInt((currentTime-startTime)/1000));
                $('#time-count').html(tempSecond);
                if(maxMpt<=((currentTime-mptTime))){
                    mptFlag = true;
                    mpt.pause();
                }
                setTimeout(function(){
                    self.countDown2();
                },1000);
            }else{
                flag = false;
//                $('#fire-img').attr("src","images/background_down_14.png");
                $('#fire-img').addClass("fire-img-3");
                $('#middle').fadeOut(0, function () {
                    $('#click-div').fadeOut(0);
                    $('#click-next').fadeIn(0);
                });
                mpt.pause();

            }
        },

        goNext:function(e){
            var obj = $(e.currentTarget);
            obj.animo( { animation: 'tada' } );
            setTimeout(function(){
                location.href = url+"/firepao/static/sub_1.jsp?name="+name+"&count="+count+"&flag=1";
            },1000);
        }


    });


    var indexView = new IndexView();

    return {
        init: function(step) {
            curStep = step;
        }
    };
});