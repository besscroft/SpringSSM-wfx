package com.bess.service;

import com.bess.beans.GoodType;

import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/9/1 11:07
 */
public interface GoodTypeService {
    public int getCount();  // 查询商品类型的总数量
    public List<GoodType> listGoodType(int page, int limit);  // 查询所有商品类型信息（分页）
    public boolean insertGoodType(GoodType goodType);   // 添加商品类型
    public boolean updateGoodType(GoodType goodType);   // 修改商品类型
    public boolean deleteGoodType(String typeId);   // 删除商品类型
    public GoodType getGoodType(String typeId); // 根据typeId查询商品类型信息
}
