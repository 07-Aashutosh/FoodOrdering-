from django.contrib import admin
from .models import MenuItem, Order,Category,OrderItem,Addon,User
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
# Register your models here.
admin.site.register(MenuItem)
admin.site.register(OrderItem)
admin.site.register(Category)
admin.site.register(Order)
admin.site.register(Addon)
@admin.register(User)
class UserAdmin(BaseUserAdmin):
    add_fieldsets = (
        (
            None,
            {
                "classes": ("wide",),
                "fields": ("username","email", "password1", "password2"),
            },
        ),
    )