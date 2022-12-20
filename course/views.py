from django.shortcuts import render, HttpResponse, redirect
from django.db import transaction
from django.http import JsonResponse

from student import models
from utils.res import ResponseData


def add(request):
    teacher_queryset = models.Teacher.objects.all()
    if request.method == 'POST':
        name = request.POST.get('name')
        credit = request.POST.get('credit')
        course_open_time = request.POST.get('date')
        teacher_id = request.POST.get('teacher')
        if not credit:
            credit = 3
        try:
            with transaction.atomic():
                models.Course.objects.create(
                    name=name, credit=credit, course_open_time=course_open_time, teacher_id=teacher_id
                )
        except Exception as e:
            print(e)
            print('服务器错误---course/add!')
        finally:
            return redirect('base:course')

    return render(request, 'course/add.html', {'teacher_queryset': teacher_queryset})


def dels(request):
    if request.is_ajax():
        if request.method == 'POST':
            res_dict = ResponseData()
            current_pk = request.POST.get('current_pk')
            try:
                models.Course.objects.filter(pk=current_pk).delete()
            except Exception as e:
                res_dict.status = 5000
                res_dict.message = '服务器错误---course/dels!'
                print(e)
                print(res_dict.message)
            finally:
                return JsonResponse(res_dict.get_dict)


def edit(request, current_pk):
    course_obj = models.Course.objects.filter(pk=current_pk).first()
    teacher_queryset = models.Teacher.objects.all()
    tem_dict = {
        'course_obj': course_obj,
        'teacher_queryset': teacher_queryset,
    }
    if request.method == 'POST':
        name = request.POST.get('name')
        credit = request.POST.get('credit')
        course_open_time = request.POST.get('date')
        teacher_id = request.POST.get('teacher')
        try:
            with transaction.atomic():
                models.Course.objects.filter(pk=current_pk).update(
                    name=name, credit=credit, course_open_time=course_open_time, teacher_id=teacher_id
                )
        except Exception as e:
            print(e)
            print('服务器错误---course/edit!')
        finally:
            return redirect('base:course')
    return render(request, 'course/edit.html', tem_dict)
