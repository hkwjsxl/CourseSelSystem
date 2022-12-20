from django.shortcuts import render, HttpResponse, redirect
from django.http import JsonResponse
from django.db import transaction

from student import models
from utils.res import ResponseData


def add(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        phone = request.POST.get('phone')
        try:
            with transaction.atomic():
                models.Teacher.objects.create(name=name, phone=phone)
        except Exception as e:
            print(e)
            print('服务器错误---teacher/add!')
        finally:
            return redirect('base:teacher')

    return render(request, 'teacher/add.html')


def edit(request, current_pk):
    teacher_obj = models.Teacher.objects.filter(pk=current_pk).first()
    if request.method == 'POST':
        name = request.POST.get('name')
        phone = request.POST.get('phone')
        models.Teacher.objects.filter(pk=current_pk).update(name=name, phone=phone)
        return redirect('base:teacher')
    return render(request, 'teacher/edit.html', {'teacher_obj': teacher_obj})


def dels(request):
    if request.is_ajax():
        if request.method == 'POST':
            res_dict = ResponseData()
            current_pk = request.POST.get('current_pk')
            try:
                models.Teacher.objects.filter(pk=current_pk).delete()
            except Exception as e:
                res_dict.status = 5000
                res_dict.message = '服务器错误---teacher/dels!'
                print(e)
                print(res_dict.message)
            finally:
                return JsonResponse(res_dict.get_dict)
