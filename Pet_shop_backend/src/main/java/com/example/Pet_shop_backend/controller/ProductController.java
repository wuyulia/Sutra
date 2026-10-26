package com.example.Pet_shop_backend.controller;

import com.example.Pet_shop_backend.common.Result;
import com.example.Pet_shop_backend.entity.Product;
import com.example.Pet_shop_backend.service.ProductService;
import com.example.Pet_shop_backend.vo.ProductDetailVO; // 确保引入了这个
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/products")
@CrossOrigin // 允许跨域
public class ProductController {

    @Autowired
    private ProductService productService;

    // 1. 搜索接口
    @GetMapping("/search")
    public Result<List<Product>> search(@RequestParam(required = false) String keyword,
                                        @RequestParam(required = false) Long categoryId,
                                        @RequestParam(required = false) Long brandId) {
        // 调用 service 里的方法
        List<Product> list = productService.searchProducts(keyword,categoryId,brandId);
        // 返回结果（记得加这一行 return）
        return Result.success(list);
    } // <--- 关键点：这里必须有个反大括号，结束 search 方法

    /**
     * 2. 新增：获取商品详情接口
     * 访问地址：GET http://localhost:8081/api/products/1001
     */
    @GetMapping("/{id}")
    public Result<ProductDetailVO> getDetail(@PathVariable Long id) {
        // 调用 service 里的获取详情方法
        ProductDetailVO detail = productService.getProductDetail(id);

        if (detail.getProduct() == null) {
            return Result.error("商品不存在");
        }

        return Result.success(detail);
    }
} // 最后一个括号关闭类