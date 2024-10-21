"""
URL configuration for newApp project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
# your_app_name/urls.py

from django.urls import path
from .views import UserProfileListCreate, UserProfileDetail, UserProfileView  # Import your views

urlpatterns = [
    path('profiles/', UserProfileListCreate.as_view(), name='userprofile-list-create'),  # List and create profiles
    path('profiles/<int:pk>/', UserProfileDetail.as_view(), name='userprofile-detail'),  # Retrieve, update, and delete a profile
    path('profile/<int:pk>/', UserProfileView.as_view(), name='userprofile'),  # Specific user profile view
]

