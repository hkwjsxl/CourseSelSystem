from django.shortcuts import render, HttpResponse, redirect
from PIL import Image, ImageDraw, ImageFont

from io import BytesIO
import random

from base.reg_forms import RegForm
from student import models
from utils.res import ResponseData
from django.http import JsonResponse
from django.contrib import auth
from django.db import transaction
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger


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
    return redirect('base:index')


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
                username = clean_data.get('username')
                try:
                    with transaction.atomic():
                        stu_obj = models.Student.objects.create(name=username)
                        models.UserInfo.objects.create_user(**clean_data, student=stu_obj)
                except Exception as e:
                    print(e)
                    print('服务器错误---register!')
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
            font = ImageFont.truetype('media/static/font/Rondal-Semibold.ttf', size=24)
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


def edit_avatar(request):
    if request.method == 'POST':
        new_avatar = request.FILES.get('new_avatar')
        if new_avatar:
            request.user.avatar = new_avatar
            request.user.save()
        return redirect('base:index')


def edit_password(request):
    if request.method == 'POST':
        old_password = request.POST.get('old_password')
        new_password = request.POST.get('new_password')
        is_right = request.user.check_password(old_password)
        if is_right:
            request.user.set_password(new_password)
            request.user.save()
            return redirect('base:signin')
        return HttpResponse('原密码错误!')


def students(request):
    student_queryset = models.Student.objects.all()
    paginator = Paginator(student_queryset, 2)
    total_pages = paginator.num_pages - 1
    current_page = request.GET.get('page', 1)
    current_page = int(current_page)
    if current_page < 1 or current_page > paginator.num_pages:
        current_page = 1
    previous_page = current_page - 1
    next_page = current_page + 1
    if previous_page == 0:
        page_ranges = range(1, 4)
    elif current_page == paginator.num_pages:
        page_ranges = range(paginator.num_pages - 2, paginator.num_pages + 1)
    else:
        page_ranges = [previous_page, current_page, next_page]
    stu_list = paginator.page(current_page)
    tem_dict = {
        'student_queryset': student_queryset,
        'paginator': paginator,
        'current_page': current_page,
        'total_pages': total_pages,
        'page_ranges': page_ranges,
        'stu_list': stu_list,
    }
    return render(request, 'base/students.html', locals())


def classes(request):
    class_queryset = models.Classes.objects.all()
    return render(request, 'base/classes.html', locals())


def course(request):
    course_queryset = models.Course.objects.all()
    return render(request, 'base/course.html', locals())


def teacher(request):
    teacher_queryset = models.Teacher.objects.all()
    return render(request, 'base/teacher.html', locals())
