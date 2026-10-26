package com.example.Pet_shop_backend.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@TableName("product_sku")
public class ProductSku {
    @TableId(type = IdType.AUTO)
    private Long id;
    private Long productId;     // 关联商品ID
    private String specValue;   // 规格值，如：5kg装
    private BigDecimal price;   // 价格
    private Integer stock;      // 库存
    private String skuImg;      // 特写图
    private LocalDateTime createTime;
}