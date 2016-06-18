from django.contrib.sitemaps import Sitemap
from django.core.urlresolvers import reverse

from browser.models import Gtin, Brand

class GtinSitemap(Sitemap):
    changefreq = "daily"
    priority = 1

    def items(self):
        return Gtin.objects.all()

class BrandSitemap(Sitemap):
    changefreq = "daily"
    priority = 1

    def items(self):
        return Brand.objects.all()

class StaticViewSitemap(Sitemap):
    priority = 1
    changefreq = 'daily'

    def items(self):
        return ['browser:home', 'browser:about', 'browser:brand_list','browser:stats','browser:owner_list']

    def location(self, item):
        return reverse(item)
