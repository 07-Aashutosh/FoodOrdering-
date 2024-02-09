from rest_framework import routers
from django.urls import path
from .views import MenuItemViewSet, OrdersViewSet, CategoryViewSet,AddonViewSet,OrderItemViewSet

router = routers.DefaultRouter()
router.register(r'menuitems', MenuItemViewSet)
router.register(r'orders', OrdersViewSet)
router.register(r'category', CategoryViewSet)
router.register(r'addon',AddonViewSet)
router.register(r'orderitem',OrderItemViewSet)


urlpatterns = [  #defining all Urls
    *router.urls,
]
