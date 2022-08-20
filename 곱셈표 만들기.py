#!/usr/bin/env python
# coding: utf-8

# In[1]:


for i in range(1, 11) :
    print(str(i)+'번째 인사')


# In[2]:


for i in range(100) :
    if i%7 == 0 :
        print(i)


# In[3]:


round((50+343+34+342+234+12)/6,1)


# In[5]:


##19단 곱셈표 만들기
number = [1,2,3,4,5,6,7,8,9]
for item in number :
    print(2 * item, end = " ")


# In[6]:


for item in range(10):
    print(item)


# In[7]:


for item in range(2,20) :
    for each in range(2,20) :
        print(item, 'X', each, ' = ', item*each)


# In[10]:


for item in range(2,20) :
    for each in range(2,20) :
        print('%d X %d = %d' %(item, each, item*each))


# In[13]:


num = [19]
for item in num :
    for each in range(1,20) :
        print('%d X %d = %d' %(item, each, item*each))


# In[ ]:




