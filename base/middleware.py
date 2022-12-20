from django.shortcuts import redirect
from django.utils.deprecation import MiddlewareMixin
from CourseSelSystem.settings import SIGNIN_NAME_LIST


class SigninMiddleware(MiddlewareMixin):
    def process_request(self, request):
        current_path = request.path
        if current_path in SIGNIN_NAME_LIST:
            return
        if not request.user.is_authenticated:
            return redirect('base:signin')
