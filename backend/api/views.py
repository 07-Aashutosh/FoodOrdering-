
from rest_framework import viewsets
from .models import MenuItem, Order,Category,OrderItem,Addon
from .serializers import MenuItemSerializer, OrderSerializer,CategorySerializer,OrderItemSerializer,AddonSerializer
from rest_framework import permissions # used for authentication 



class MenuItemViewSet(viewsets.ModelViewSet):
    queryset = MenuItem.objects.all() # carrying all objects of menu item 
    serializer_class = MenuItemSerializer # converting objects into seriallizer pipe line 
    permission_classes = [permissions.IsAuthenticatedOrReadOnly] # read only or authenticated 

class OrdersViewSet(viewsets.ModelViewSet):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer
    permission_classes = [permissions.IsAuthenticated]

class CategoryViewSet(viewsets.ModelViewSet):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

class OrderItemViewSet(viewsets.ModelViewSet):
    queryset = OrderItem.objects.all()
    serializer_class = OrderItemSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

class AddonViewSet(viewsets.ModelViewSet):
    queryset = Addon.objects.all()
    serializer_class = AddonSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]





