from django import forms


class RegForm(forms.Form):
    username = forms.CharField(
        min_length=3, max_length=8, label='用户名',
        error_messages={
            'min_length': '用户名最少3位',
            'max_length': '用户名最大8位',
            'required': "用户名不能为空"
        },
        widget=forms.widgets.TextInput(attrs={'class': 'form-control'})
    )
    password = forms.CharField(
        min_length=3, max_length=8, label='密码',
        error_messages={
            'min_length': '密码最少3位!',
            'max_length': '密码最大8位!',
            'required': "密码不能为空!"
        },
        widget=forms.widgets.PasswordInput(attrs={'class': 'form-control'})
    )
    confirm_password = forms.CharField(
        min_length=3, max_length=8, label='确认密码',
        error_messages={
            'min_length': '确认密码最少3位!',
            'max_length': '确认密码最大8位!',
            'required': "确认密码不能为空!"
        },
        widget=forms.widgets.PasswordInput(attrs={'class': 'form-control'})
    )
    email = forms.EmailField(
        label='邮箱',
        error_messages={
            'invalid': '邮箱格式不正确!',
            'required': "邮箱不能为空!"
        },
        initial='test@test.com',
        widget=forms.widgets.EmailInput(attrs={'class': 'form-control'})
    )

    # 局部钩子
    def clean_username(self):
        username = self.cleaned_data.get('username')
        if username in ['admin', '管理员']:
            self.add_error('username', '用户名不合法!')
        return username

    # 全局钩子
    def clean(self):
        password = self.cleaned_data.get('password')
        confirm_password = self.cleaned_data.get('confirm_password')
        if confirm_password != password:
            self.add_error('confirm_password', '两次密码不一致!')
        return self.cleaned_data
