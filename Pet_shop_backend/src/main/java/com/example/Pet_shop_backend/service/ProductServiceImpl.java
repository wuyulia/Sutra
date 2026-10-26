package com.example.Pet_shop_backend.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.Pet_shop_backend.entity.Product;
import com.example.Pet_shop_backend.entity.ProductSku;
import com.example.Pet_shop_backend.mapper.ProductMapper;
import com.example.Pet_shop_backend.mapper.ProductSkuMapper;
import com.example.Pet_shop_backend.vo.ProductDetailVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements ProductService {

    @Autowired
    private ProductSkuMapper productSkuMapper; // 注入 SKU 的 Mapper

    @Override
    public List<Product> searchProducts(String keyword,Long categoryId,Long brandId) {
        LambdaQueryWrapper<Product> wrapper = new LambdaQueryWrapper<>();

        // 1.如果有关键字，模糊查询名称
        if (keyword != null && !keyword.trim().isEmpty()) {
            wrapper.like(Product::getName, keyword);
        }
        // 2.如果有分类ID，精确匹配分类
        if (categoryId != null) {
            wrapper.eq(Product::getCategoryId, categoryId);
        }

        // 3.如果有品牌ID，精确匹配品牌
        if (brandId != null) {
            wrapper.eq(Product::getBrandId, brandId);
        }
        //只查上架商品
        wrapper.eq(Product::getStatus, 1);

        return baseMapper.selectList(wrapper);
    }
    @Override
    public ProductDetailVO getProductDetail(Long id) {
        ProductDetailVO vo = new ProductDetailVO();

        // 1. 查询商品基本信息
        Product product = baseMapper.selectById(id);
        vo.setProduct(product);

        // 2. 查询该商品关联的所有规格 (SKU)
        // 对应 SQL: SELECT * FROM product_sku WHERE product_id = ?
        List<ProductSku> skus = productSkuMapper.selectList(
                new LambdaQueryWrapper<ProductSku>().eq(ProductSku::getProductId, id)
        );
        vo.setSkus(skus);

        return vo;}
}