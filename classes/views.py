from django.shortcuts import render, HttpResponse, redirect
from django.http import JsonResponse
from django.db import transaction

from student import models
from utils.res import ResponseData


def add(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        try:
            with transaction.atomic():
                models.Classes.objects.create(name=name)
        except Exception as e:
            print(e)
            print('服务器错误---classes/add!')
        finally:
            return redirect('base:classes')

    return render(request, 'classes/add.html')


def edit(request, current_pk):
    class_obj = models.Classes.objects.filter(pk=current_pk).first()
    if request.method == 'POST':
        name = request.POST.get('name')
        models.Classes.objects.filter(pk=current_pk).update(name=name)
        return redirect('base:classes')
    return render(request, 'classes/edit.html', {'class_obj': class_obj})


def dels(request):
    if request.is_ajax():
        if request.method == 'POST':
            res_dict = ResponseData()
            current_pk = request.POST.get('current_pk')
            try:
                models.Classes.objects.filter(pk=current_pk).delete()
            except Exception as e:
                res_dict.status = 5000
                res_dict.message = '服务器错误---student/dels!'
                print(e)
                print(res_dict.message)
            finally:
                return JsonResponse(res_dict.get_dict)
