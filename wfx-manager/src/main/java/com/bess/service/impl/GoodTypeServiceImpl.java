package com.bess.service.impl;

import com.bess.beans.GoodType;
import com.bess.dao.GoodTypeDAO;
import com.bess.service.GoodTypeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/9/1 11:08
 */
@Service
public class GoodTypeServiceImpl implements GoodTypeService {

    @Resource
    private GoodTypeDAO goodTypeDAO;

    @Override
    public int getCount() {
        return goodTypeDAO.getCount();
    }

    @Override
    public List<GoodType> listGoodType(int page, int limit) {
        int start = (page-1)*limit;
        return goodTypeDAO.listGoodType(start,limit);
    }

    @Override
    @Transactional(isolation = Isolation.REPEATABLE_READ, propagation = Propagation.REQUIRED)
    public boolean insertGoodType(GoodType goodType) {
        return goodTypeDAO.insertGoodType(goodType) > 0;
    }

    @Override
    @Transactional(isolation = Isolation.REPEATABLE_READ, propagation = Propagation.REQUIRED)
    public boolean updateGoodType(GoodType goodType) {
        return goodTypeDAO.updateGoodType(goodType) > 0;
    }

    @Override
    @Transactional(isolation = Isolation.REPEATABLE_READ, propagation = Propagation.REQUIRED)
    public boolean deleteGoodType(String typeId) {
        return goodTypeDAO.deleteGoodType(typeId) > 0;
    }

    @Override
    public GoodType getGoodType(String typeId) {
        return goodTypeDAO.getGoodType(typeId);
    }
}
