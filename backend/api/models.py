from django.db import models
from django.contrib.auth.models import AbstractUser

class MenuItem(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    image = models.ImageField(upload_to='media/menu_images/', null=True, blank=True)
    category = models.ForeignKey('Category', on_delete=models.CASCADE, related_name='menu_items')
    addons = models.ManyToManyField('Addon', blank=True)
    availability = models.BooleanField(default=True)

    def __str__(self): # description of table item name on admin pannel 
        return self.name

class Category(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class Addon(models.Model):
    name = models.CharField(max_length=100)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    # category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='addons', null=True, blank=True)

    def __str__(self):
        return self.name

class OrderItem(models.Model):
    menu_item = models.ForeignKey(MenuItem, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)
    price=models.DecimalField(max_digits=10,decimal_places=2)
     # Add field for quantity
    

class Order(models.Model):
    STATUS_CHOICES = (
        ('pending', 'Pending'),
        ('confirmed','Confirmed'),
        ('processing', 'Food is cooking'),
        ('completed', 'Ready to serve'),
    )
    user = models.ForeignKey('User', on_delete=models.CASCADE)
    total_price = models.DecimalField(max_digits=10, decimal_places=2)
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='pending')
    # delivery_address = models.CharField(max_length=255, blank=True, null=True)
    # delivery_time = models.DateTimeField(blank=True, null=True)
    order_item=models.ManyToManyField('OrderItem')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at=models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"Order #{self.id} by {self.user.username}"

# Custom user model
class User(AbstractUser): # ready made model of user 
    email=models.EmailField(unique=True)
    
