#
//  profileModel.py
//  newApp
//
//  Created by James Avey on 19/10/2024.
//


from django.db import models

class user(models.Model):
    firstName = models.CharField(max_length=25)
    SecondName = models.CharField(max_length=25)
    userName = models.CharField(max_length=25)
