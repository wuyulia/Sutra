package com.example.Pet_shop_backend.vo;

import com.example.Pet_shop_backend.entity.Product;
import com.example.Pet_shop_backend.entity.ProductSku;
import lombok.Data;
import java.util.List;

@Data
public class ProductDetailVO {
    private Product product;          // 商品基本信息 (SPU)
    private List<ProductSku> skus;    // 规格列表 (SKU)
}