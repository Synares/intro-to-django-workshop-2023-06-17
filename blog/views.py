from django.shortcuts import render
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView

from blog.models import Blog
from blog.serializers import BlogSerializer


class BlogView(APIView):

    def get(self, request):
        query = Blog.objects.all()
        data = BlogSerializer(query, many=True)

        return Response(BlogSerializer(data.data, status=status.HTTP_200_OK))
