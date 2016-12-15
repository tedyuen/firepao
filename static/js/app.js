/**
 * Created by tedyuen on 15/2/11.
 */
define(function(require,exports,module){
    require('./config');
    require('./fire-config');
    var AppRouter = Backbone.Router.extend({
        routes: {
            '': 'index_00',
            '!index_11/:step': 'index_11',
            '!index_21/:step': 'index_21'
        },

        index_00: function(step) {
            require.async('./index', function(index) {
                index.init(step);
            });
        },
        index_11: function(step) {
            require.async('./index_11', function(index) {
                index.init(step);
            });
        },
        index_21: function(step) {
            require.async('./index_21', function(index) {
                index.init(step);
            });
        }

    });

    window['app_router'] = new AppRouter;
    Backbone.history.start();

});