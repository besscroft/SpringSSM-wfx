package com.bess.dao;

import com.bess.beans.GoodType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/9/1 11:01
 */
public interface GoodTypeDAO {
    public int getCount();  // 查询商品类型的总数量
    public List<GoodType> listGoodType(@Param("start") int start,
                                       @Param("limit") int limit);  // 查询所有商品类型信息（分页）
    public int insertGoodType(GoodType goodType);   // 添加商品类型
    public int updateGoodType(GoodType goodType);   // 修改商品类型
    public int deleteGoodType(String typeId);   // 删除商品类型
    public GoodType getGoodType(String typeId); // 根据typeId查询商品类型信息
}
