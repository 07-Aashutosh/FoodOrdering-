from rest_framework import serializers

from .models import MenuItem, Order,Category,OrderItem,Addon

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = '__all__'

class OrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = '__all__'
class OrderItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrderItem
        fields = '__all__'

class AddonSerializer(serializers.ModelSerializer):
    class Meta:
        model = Addon
        fields = '__all__'

class MenuItemSerializer(serializers.ModelSerializer):
    addons=AddonSerializer(many=True,read_only=True) # many to many relation, read only for user 
    category=CategorySerializer(read_only=True)
    class Meta:
        model = MenuItem
        fields = '__all__'

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = '__all__'
