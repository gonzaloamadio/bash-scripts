# -*- coding: utf-8 -*-
import string
from datetime import datetime, timedelta, date

categories=[]

for d in range(31):
    for i in range(23):
        if i <= 9:
            hour = "0"+str(i)
        else:
            hour = str(i)

        if d <= 9:
            day = "0"+str(d)
        else:
            day = str(d)

        categories.append(hour+"-"+day)

print(categories)
