package com.bess.dao;

import com.bess.beans.Good;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/9/1 0:09
 */
public interface GoodDAO {
    public int getCount();  // 查询商品的总数量
    public List<Good> listGood(@Param("start") int start,
                                       @Param("limit") int limit);   // 查询所有商品信息（分页）
    public int updateState(@Param("goodId") String goodId,
                           @Param("state") String state);   // 更新商品上架审核信息
    public int updateToped(@Param("goodId") String goodId,
                           @Param("toped") String toped);   // 更新商品置顶信息
    public int updateRecomed(@Param("goodId") String goodId,
                           @Param("recomed") String recomed);   // 更新商品推荐信息
}
