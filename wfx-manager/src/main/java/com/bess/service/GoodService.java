package com.bess.service;

import com.bess.beans.Good;

import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/9/1 0:15
 */
public interface GoodService {
    public int getCount();  // 查询商品的总数量
    public List<Good> listGood(int page, int limit);   // 查询所有商品信息（分页）
    public boolean updateState(String goodId,String state);   // 更新商品上架审核信息
    public boolean updateToped(String goodId,String toped);   // 更新商品置顶信息
    public boolean updateRecomed(String goodId,String recomed);   // 更新商品推荐信息
}
