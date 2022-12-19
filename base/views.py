from django.shortcuts import render, HttpResponse, redirect
from PIL import Image, ImageDraw, ImageFont

from io import BytesIO
import random

from base.reg_forms import RegForm
from student import models
from utils.res import ResponseData
from django.http import JsonResponse
from django.contrib import auth


# Create your views here.
def index(request):

    return render(request, 'base/index.html', locals())


def signin(request):
    if request.is_ajax():
        if request.method == 'POST':
            res_dict = ResponseData()
            session_code = request.session.get('auth_code')
            auth_code = request.POST.get('auth_code')
            if auth_code.upper() != session_code.upper():
                res_dict.status = 4000
                res_dict.message = '验证码输入不正确!'
                return JsonResponse(res_dict.get_dict)
            username = request.POST.get('username')
            password = request.POST.get('password')
            user_obj = auth.authenticate(request, username=username, password=password)
            if user_obj:
                auth.login(request, user_obj)
                res_dict.message = '登录成功!'
            else:
                res_dict.status = 4000
                res_dict.message = '用户名或密码输入不正确!'
            return JsonResponse(res_dict.get_dict)
    return render(request, 'base/signin.html')


def signout(request):
    auth.logout(request)
    return redirect('base:signin')


def register(request):
    form_obj = RegForm()
    if request.is_ajax():
        if request.method == 'POST':
            res_dict = ResponseData()
            form_obj = RegForm(request.POST)
            if form_obj.is_valid():
                clean_data = form_obj.cleaned_data
                clean_data.pop('confirm_password')
                avatar = request.FILES.get('avatar')
                if avatar:
                    clean_data['avatar'] = avatar
                print(clean_data)
                username = clean_data.get('username')
                stu_obj = models.Student.objects.create(name=username)
                models.UserInfo.objects.create_user(**clean_data, student=stu_obj)
            else:
                error_data = form_obj.errors
                res_dict.status = 4000
                res_dict.message = '数据检验失败!'
                res_dict.data = error_data
            return JsonResponse(res_dict.get_dict)

    return render(request, 'base/register.html', {'form_obj': form_obj})


def get_auth_code(request, size=(450, 35), mode="RGB", bg_color=(255, 255, 255)):
    """ 生成一个图片验证码 """
    _letter_cases = "abcdefghjkmnpqrstuvwxy"  # 小写字母，去除可能干扰的i，l，o，z
    _upper_cases = _letter_cases.upper()  # 大写字母
    _numbers = ''.join(map(str, range(3, 10)))  # 数字
    chars = ''.join((_letter_cases, _upper_cases, _numbers))

    width, height = size  # 宽高
    # 创建图形
    img = Image.new(mode, size, bg_color)
    draw = ImageDraw.Draw(img)  # 创建画笔

    def get_chars():
        """生成给定长度的字符串，返回列表格式"""
        return random.sample(chars, 4)

    def create_lines():
        """绘制干扰线"""
        line_num = random.randint(*(1, 2))  # 干扰线条数

        for i in range(line_num):
            # 起始点
            begin = (random.randint(0, size[0]), random.randint(0, size[1]))
            # 结束点
            end = (random.randint(0, size[0]), random.randint(0, size[1]))
            draw.line([begin, end], fill=(0, 0, 0))

    def create_points():
        """绘制干扰点"""
        chance = min(100, max(0, int(2)))  # 大小限制在[0, 100]

        for w in range(width):
            for h in range(height):
                tmp = random.randint(0, 100)
                if tmp > 100 - chance:
                    draw.point((w, h), fill=(0, 0, 0))

    def create_code():
        """绘制验证码字符"""
        char_list = get_chars()
        code_string = ''.join(char_list)  # 每个字符前后以空格隔开

        for i in range(len(char_list)):
            code_str = char_list[i]
            font = ImageFont.truetype('static/font/Rondal-Semibold.ttf', size=24)
            draw.text(((i + 1) * 75, 0), code_str, "red", font=font)

        return code_string

    create_lines()
    create_points()
    code = create_code()
    print(code)

    request.session['auth_code'] = code

    io_obj = BytesIO()
    img.save(io_obj, 'PNG')
    return HttpResponse(io_obj.getvalue())
