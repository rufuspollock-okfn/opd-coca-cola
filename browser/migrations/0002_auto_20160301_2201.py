# -*- coding: utf-8 -*-
# Generated by Django 1.9.2 on 2016-03-01 14:01
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('browser', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='packaging',
            name='PACKAGING_LINK',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
    ]