from django.urls import path
from base import views

urlpatterns = [
    path('', views.index, name='index'),
    path('signin/', views.signin, name='signin'),
    path('signout/', views.signout, name='signout'),
    path('register/', views.register, name='register'),
    path('get_auth_code/', views.get_auth_code, name='get_auth_code'),

    path('edit_avatar/', views.edit_avatar, name='edit_avatar'),
    path('edit_password/', views.edit_password, name='edit_password'),

    path('students/', views.students, name='students'),
    path('classes/', views.classes, name='classes'),
    path('course/', views.course, name='course'),
    path('teacher/', views.teacher, name='teacher'),

]
