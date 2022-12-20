from django.db import models
from django.contrib.auth.models import AbstractUser

import os


def user_directory_path(instance, filename):
    return os.path.join('user_dir_path', instance.username, "avatars", filename)


class UserInfo(AbstractUser):
    avatar = models.ImageField(upload_to=user_directory_path, default='/static/images/default.png')
    student = models.OneToOneField(to='Student', on_delete=models.CASCADE)

    class Meta:
        db_table = "db_userinfo"

    def __str__(self):
        return self.username


class Student(models.Model):
    name = models.CharField(max_length=32, verbose_name='学生姓名')
    age = models.SmallIntegerField(default=18, verbose_name='学生年龄')
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')

    student_detail = models.OneToOneField(to='StudentDetail', on_delete=models.CASCADE, null=True, blank=True)
    classes = models.ForeignKey(to='Classes', on_delete=models.CASCADE, related_name='classes', null=True, blank=True)
    course = models.ManyToManyField(
        to='Course',
        through='Student2Course',
        through_fields=('student', 'course'),
        related_name='student_course',
    )

    class Meta:
        db_table = "db_student"

    def __str__(self):
        return self.name


class Classes(models.Model):
    name = models.CharField(max_length=32, verbose_name='班级名称')

    class Meta:
        db_table = "db_classes"

    def __str__(self):
        return self.name


class Course(models.Model):
    name = models.CharField(max_length=32, verbose_name='课程名称')
    credit = models.SmallIntegerField(default=3, verbose_name='课程学分')
    course_open_time = models.DateField(auto_now=True, verbose_name='开课时间')

    teacher = models.ForeignKey(to='Teacher', on_delete=models.CASCADE, related_name='teacher', null=True, blank=True)

    class Meta:
        db_table = "db_course"

    def __str__(self):
        return self.name


class Teacher(models.Model):
    name = models.CharField(max_length=32, verbose_name='老师姓名')
    phone = models.CharField(max_length=11, null=True, blank=True, verbose_name='老师手机号')

    class Meta:
        db_table = "db_teacher"

    def __str__(self):
        return self.name


class StudentDetail(models.Model):
    gender_choice = (
        (0, '保密'),
        (1, '男'),
        (2, '女'),
    )
    gender = models.SmallIntegerField(choices=gender_choice, default=0, verbose_name='性别')
    addr = models.CharField(max_length=64, null=True, blank=True, verbose_name='地址详情')
    phone = models.CharField(max_length=11, null=True, blank=True, verbose_name='手机号')

    class Meta:
        db_table = "db_student_detail"


class Student2Course(models.Model):
    student = models.ForeignKey(to='Student', on_delete=models.CASCADE)
    course = models.ForeignKey(to='Course', on_delete=models.CASCADE)
    choice_course_time = models.DateTimeField(auto_now_add=True, verbose_name='学生选课时间')

    class Meta:
        db_table = "db_student2course"
