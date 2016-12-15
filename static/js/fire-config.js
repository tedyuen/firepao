define(function(require, exports, module) {
    var leftHash = '';
    var rightHash = '';

    function goBack() {
        if (leftHash != '') {
            location.hash = leftHash;

        } else {
            context.quit();
        }
    }
    document.addEventListener('onbeforeunload', goBack, false);

    C.Config = $.extend(C.Config, {
        leftBar: function(state) {
            switch (state) {
                case 'index':
                    leftHash = '';
                    break;
                case 'indexCompany':
                    leftHash = '';
                    break;
            }
        }
    });

});