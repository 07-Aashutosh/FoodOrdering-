from django.contrib import admin
from django.urls import path,include
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('api.urls')), # including all urls of api app
    path('',include('rest_framework.urls')),
    path('auth/', include('dj_rest_auth.urls'),name="loginndsaf"), 
    path('auth/registration/', include('dj_rest_auth.registration.urls')),
    path('allauth/', include('allauth.urls')),

]+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT) # serving menuitem image urls 

