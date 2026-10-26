package com.example.Pet_shop_backend.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.Pet_shop_backend.entity.Product;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper extends BaseMapper<Product> {
}