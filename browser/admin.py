from django.contrib import admin
from browser.models import Brand, Gtin, Gs1_gcp, Brand_owner, Packaging

class BrandAdmin(admin.ModelAdmin):
    list_display    = ('BSIN','BRAND_NM')
    ordering        = ('BRAND_NM',)

class GtinAdmin(admin.ModelAdmin):
    list_display    = ('GTIN_CD','GCP_CD', 'BSIN','GTIN_NM','PRODUCT_LINE','PKG_UNIT','M_ML','M_FLOZ','M_G','M_OZ')
    ordering        = ('BSIN','PRODUCT_LINE','PKG_UNIT',)
    search_fields   = ['GTIN_CD']


class Gs1_gcpAdmin(admin.ModelAdmin):
    list_display    = ('GCP_CD','GLN_NM','GLN_COUNTRY_ISO_CD')
    ordering        = ('GCP_CD','GLN_NM',)

class Brand_ownerAdmin(admin.ModelAdmin):
    list_display    = ('OWNER_CD','OWNER_NM')

class PackagingAdmin(admin.ModelAdmin):
    list_display    = ('PACKAGING_CD','PACKAGING_NM')


admin.site.register(Brand, BrandAdmin)
admin.site.register(Gtin, GtinAdmin)
admin.site.register(Gs1_gcp, Gs1_gcpAdmin)
admin.site.register(Brand_owner, Brand_ownerAdmin)
admin.site.register(Packaging, PackagingAdmin)
