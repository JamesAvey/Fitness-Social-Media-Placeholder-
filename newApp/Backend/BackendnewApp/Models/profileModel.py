#
//  profileModel.py
//  newApp
//
//  Created by James Avey on 19/10/2024.
//



from django.db import models
from django.contrib.auth.models import User

class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    bench = models.PositiveIntegerField(blank=False)
    squat = models.PositiveIntegerField(blank=False)
    deadlift = models.PositiveIntegerField(blank=False)
    profile_picture = models.ImageField(upload_to='profile_pics/', blank=True, null=True)
    birth_date = models.DateField(null=True, blank=True)
    followers = models.ManyToManyField('self', symmetrical=False, related_name='following', blank=True)
    rivals = models.ManyToManyField('self', symmetrical=False, related_name='rivals', blank=True)
    date_created = models.DateTimeField(auto_now_add=True)  # Automatically set date and time when created

    def __str__(self):
        return self.user.username
