from django.contrib import admin
from django.urls import path, include

from blog.views import BlogView

urlpatterns = [
    path('', BlogView.as_view()),
]
