from django.shortcuts import get_object_or_404, render
from django.http import HttpResponse
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.views import generic
from django.conf import settings

from .models import Gtin, Nutrition, Brand, Brand_owner, Search, Gtin_img, Brand_img, Brand_owner_img
from django.db.models import Count

# --------------------------------------------------------------------
#  WEBSITE BROWSER
# --------------------------------------------------------------------
import requests

def Show_gtin_img(request,pk):
    # 1. If images are stored in database
    #BinaryImg = Gtin_img.objects.get(pk=pk).GTIN_IMG,
    #return HttpResponse(BinaryImg, 'image/jpg')

    # 2. If images are stored on amazon S3
    #img_path = settings.MEDIA_URL + 'gtin/gtin-' + pk[0:3] + '/' + pk + '.jpg'
    img_path = settings.MEDIA_ROOT + 'gtin/' + pk + '.jpg'
    return HttpResponse(requests.get(img_path), 'image/jpg')

def Show_brand_img(request,pk):
    # 1. If images are stored in database
    #BinaryImg = Brand_img.objects.get(pk=pk).BSIN_IMG,
    #return HttpResponse(BinaryImg, 'image/jpg')

    # 2. If images are stored on amazon S3
    img_path = 'http://product.okfn.org.s3.amazonaws.com/images/brand/' + pk + '.jpg'
    #img_path = settings.MEDIA_ROOT + '/brand/' + pk + '.jpg'
    return HttpResponse(requests.get(img_path), 'image/jpg')

def Show_owner_img(request,pk):
    # 1. If images are stored in database
    #BinaryImg = Brand_owner_img.objects.get(pk=pk).OWNER_IMG,
    #return HttpResponse(BinaryImg, 'image/jpg')

    # 2. If images are stored on amazon S3
    img_path = 'http://product.okfn.org.s3.amazonaws.com/images/owner/' + pk + '.jpg'
    return HttpResponse(requests.get(img_path), 'image/jpg')

def search_gtin(request):
    if Search.objects.filter(pk=request.POST['gtin']).exists():
        search_gtin = Search.objects.get(pk=request.POST['gtin'])
        search_gtin.SEARCH_NB += 1
        search_gtin.save()
    else:
        new_entry = Search(GTIN_CD = request.POST['gtin'], SEARCH_NB = 1)
        new_entry.save()

    try:
        if request.POST['gtin']:
            gtin = Gtin.objects.get(pk=request.POST['gtin'])
    except (KeyError, Gtin.DoesNotExist):
        return render(request, 'browser/home.html', {
            'error_message': "This GTIN is not in the database",
        })
    else:
        return HttpResponseRedirect(reverse('browser:gtin', args=(gtin,)))

class ViewGtin(generic.DetailView):
    template_name = 'browser/gtin.html'
    model = Gtin

    queryset = Gtin.objects.all()

    def get_object(self):
        object = super(ViewGtin, self).get_object()
        if object.GTIN_CD and object.GTIN_CD[0:1] == "0":
            object.UPC_CD = object.GTIN_CD[1:12]
        object.save()
        return object

class ViewBrandList(generic.ListView):
    template_name = 'browser/brand_list.html'
    context_object_name = 'page_brand_list'
    model = Brand

    def get_queryset(self):
        return Brand.objects.order_by('BRAND_NM')

class ViewBsin(generic.ListView):
    template_name = 'browser/bsin.html'
    context_object_name = 'gtin_list'
    model = Gtin

    def get_context_data(self, **kwargs):
        context = super(ViewBsin, self).get_context_data(**kwargs)
        context.update({
            'bsin_detail': Brand.objects.get(pk=self.kwargs['bsin']),
            #'gtin_count' : Gtin.objects.values('GCP_CD__GLN_COUNTRY_ISO_CD').annotate(dcount=Count('GTIN_CD'))
        })
        return context

    def get_queryset(self):
        bsin = self.kwargs['bsin']
        return Gtin.objects.filter(BSIN=bsin).order_by('GCP_CD','PRODUCT_LINE','M_FLOZ','M_ML','PKG_UNIT','GTIN_NM')


class ViewStats(generic.ListView):
    template_name = 'browser/stats.html'
    context_object_name = 'stats_data'
    model = Gtin

    def get_context_data(self, **kwargs):
        context = super(ViewStats, self).get_context_data(**kwargs)
        context.update({
            'gtin_total_count' : Gtin.objects.aggregate(Count('GTIN_CD')),
            'gtin_count' : Gtin.objects.values('GCP_CD__GLN_COUNTRY_ISO_CD').annotate(dcount=Count('GTIN_CD'))
        })
        return context

    def get_queryset(self):
        return Gtin.objects.values('GCP_CD__GLN_COUNTRY_ISO_CD').annotate(dcount=Count('GTIN_CD'))


class ViewOwnerList(generic.ListView):
    template_name = 'browser/brand_owner_list.html'
    context_object_name = 'owner_list'
    model = Brand_owner

    def get_queryset(self):
        """Return the last five published questions."""
        return Brand_owner.objects.order_by('OWNER_NM')

class ViewOwner(generic.ListView):
    template_name = 'browser/brand_owner.html'
    context_object_name = 'brand_list'
    model = Brand

    def get_context_data(self, **kwargs):
        context = super(ViewOwner, self).get_context_data(**kwargs)
        context.update({
            'owner_detail': Brand_owner.objects.get(pk=self.kwargs['owner']),
        })
        return context

    def get_queryset(self):
        """Return the last five published questions."""
        owner = self.kwargs['owner']
        return Brand.objects.filter(OWNER_CD=owner).order_by('BRAND_NM')

# --------------------------------------------------------------------
#   REST API DRF
# --------------------------------------------------------------------

# gtin for test : 0836093401314    0857063002652
