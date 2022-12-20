from django.contrib import admin
from django.urls import path, include, re_path
from django.views.static import serve
from CourseSelSystem import settings

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include(('base.urls', 'base'), namespace='base')),
    path('student/', include(('student.urls', 'student'), namespace='student')),
    path('classes/', include(('classes.urls', 'classes'), namespace='classes')),
    path('course/', include(('course.urls', 'course'), namespace='course')),
    path('teacher/', include(('teacher.urls', 'teacher'), namespace='teacher')),

    re_path(r'^media/(?P<path>.*)', serve, {'document_root': settings.MEDIA_ROOT}),

]
