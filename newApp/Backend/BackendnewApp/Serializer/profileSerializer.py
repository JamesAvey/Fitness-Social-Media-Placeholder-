#
//  profileSerializer.py
//  newApp
//
//  Created by James Avey on 21/10/2024.
//

from rest_framework import serializers
from .models import UserProfile

class UserProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserProfile
        fields = ['user', 'bench', 'squat', 'deadlift', 'profile_picture', 'birth_date', 'followers', 'rivals', 'data_created']
