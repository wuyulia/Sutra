package com.example.Pet_shop_backend.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.Pet_shop_backend.entity.Product;
import com.example.Pet_shop_backend.vo.ProductDetailVO;

import java.util.List;

public interface ProductService extends IService<Product> {
    // 定义一个搜索商品的方法
    List<Product> searchProducts(String keyword,Long categoryId,Long brandId);
    // 新增：根据ID获取商品详情（包含规格）
    ProductDetailVO getProductDetail(Long id);
}