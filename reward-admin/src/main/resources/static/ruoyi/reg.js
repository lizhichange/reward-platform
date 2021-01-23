$(function () {
    validateRule();
});

$.validator.setDefaults({
    submitHandler: function () {
        reg();
    }
});

function reg() {
    $.modal.loading($("#btnSubmit").data("loading"));
    var loginName = $.common.trim($("input[name='loginName']").val());
    var userName = $.common.trim($("input[name='userName']").val());
    var password = $.common.trim($("input[name='password']").val());
    var invitation = $.common.trim($("input[name='invitation']").val());
    var payee = $.common.trim($("input[name='payee']").val());
    var payeeAccount = $.common.trim($("input[name='payeeAccount']").val());

    $.ajax({
        type: "POST",
        url: ctx + "webLogin/reg",
        data: {
            "loginName": loginName,
            "userName": userName,
            "password": password,
            "invitation": invitation,
            "payee": payee,
            "payeeAccount": payeeAccount
        },
        success: function (r) {
            if (r.code === 0) {
                $.modal.msg('注册成功');
                location.href = ctx + 'webLogin';
            } else {
                $.modal.closeLoading();
                $.modal.msg(r.msg);
            }
        }
    });
}

function validateRule() {
    let icon = "<i class='fa fa-times-circle'></i> ";
    $("#signupForm").validate({
        rules: {
            loginName: {
                required: true
            },
            userName: {
                required: true
            },

            password: {
                required: true
            }
        },
        messages: {
            loginName: {
                required: icon + "请输入您的登录账号",
            },

            userName: {
                required: icon + "请输入您的用户昵称",
            },
            password: {
                required: icon + "请输入您的密码",
            }
            ,
            invitation: {
                required: icon + "请输入邀请码",
            }
            ,
            payee: {
                required: icon + "请输入收款人",
            }
            ,
            payeeAccount: {
                required: icon + "请输入收款账号",
            }
        }
    });
}


