package com.example.Pet_shop_backend.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.math.BigDecimal;

@Data
@TableName("product")
public class Product {
    @TableId(type = IdType.AUTO)
    private Long id;
    private String name;
    private BigDecimal price;
    private String coverImg;
    private Long categoryId;
    private Long brandId;
    private Integer stock;
    private Integer salesVolume;
    private Integer isSelfOperated;
    private Integer status;
}