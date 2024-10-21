#
//  profileView.py
//  newApp
//
//  Created by James Avey on 21/10/2024.
//

from rest_framework import generics
from .models import UserProfile
from .serializers import UserProfileSerializer
from rest_framework.permissions import AllowAny  # Allows access without authentication

class UserProfileView(generics.RetrieveAPIView):
    queryset = UserProfile.objects.all()
    serializer_class = UserProfileSerializer
    permission_classes = [AllowAny]  # Allow access without any login

