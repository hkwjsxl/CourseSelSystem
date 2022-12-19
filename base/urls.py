from django.urls import path
from base import views

urlpatterns = [
    path('', views.index, name='index'),
    path('signin/', views.signin, name='signin'),
    path('signout/', views.signout, name='signout'),
    path('register/', views.register, name='register'),
    path('get_auth_code/', views.get_auth_code, name='get_auth_code'),

]
