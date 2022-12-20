from django.urls import path
from teacher import views

urlpatterns = [
    path('add/', views.add, name='add'),
    path('edit/<int:current_pk>', views.edit, name='edit'),
    path('dels/', views.dels, name='dels'),

]
