var auth = {

	// create Form
	createForm : function(id) {
        var form = document.getElementById(id);
        if (form)
            $(form).remove();

        form = document.createElement('form');
        form.name = id;
        form.id = id;
        form.style.display = 'none';

        var body = document.getElementsByTagName('body').item(0);
        body.appendChild(form);

        return form;
    },

	// create Input
	createHiddenInput : function(name, value){
        var hiddenField = document.createElement('input');
        hiddenField.setAttribute('type', 'hidden');
        hiddenField.setAttribute('id', name);
        hiddenField.setAttribute('name', name);
        hiddenField.setAttribute('value', value);

        return hiddenField;
	},

    // cp auth
	doMobileAuth : function(options) {
    	options = $.extend({
    		returnUrl : 'TODO',
    		deviceType : 'TODO',
    		mbrLgnId : ''
    	}, options);

        var self = this;
        window.open('', 'Window', 'width=520, height=660, top=0, left=0,fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes,location=no, scrollbar=no');

        $.post('/auth/setSessionAuthParam', 'post', JSON.stringify(options), function (data) {
            /*if (data.result) {*/
            var formId = "form_chk";
            var form = auth.createForm(formId);
            form.setAttribute('method', 'post');
            form.setAttribute('target', 'Window');
            form.setAttribute('action', '/auth/check-main');
            form.appendChild(self.createHiddenInput('param_r1', options.returnUrl));
            form.appendChild(self.createHiddenInput('param_r2', options.deviceType));
            form.appendChild(self.createHiddenInput('param_r3', options.mbrLgnId));
            form.submit();
            /* }*/
        }), function (data) {
            // TODO change alert Message
            alert("잠시후 다시 실행 하여 주십시오.");
        }
	},

	// callback fn
	callbackAuth : function(returnUrl, mbrLgnId) {
    	// mobile
    	if (view.callbackAuthPage != undefined) {
    		view.callbackAuthPage(returnUrl);
    	} else {
    		location.href = returnUrl;
    	}
	}
}