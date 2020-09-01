package com.bess.service.impl;

import com.bess.beans.Good;
import com.bess.dao.GoodDAO;
import com.bess.service.GoodService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/9/1 0:15
 */
@Service
public class GoodServiceImpl implements GoodService {

    @Resource
    private GoodDAO goodDAO;

    @Override
    public int getCount() {
        return goodDAO.getCount();
    }

    @Override
    public List<Good> listGood(int page, int limit) {
        int start = (page-1)*limit;
        return goodDAO.listGood(start,limit);
    }

    @Override
    @Transactional(isolation = Isolation.REPEATABLE_READ,propagation = Propagation.REQUIRED)
    public boolean updateState(String goodId, String state) {
        return goodDAO.updateState(goodId,state) > 0;
    }

    @Override
    @Transactional(isolation = Isolation.REPEATABLE_READ,propagation = Propagation.REQUIRED)
    public boolean updateToped(String goodId, String toped) {
        return goodDAO.updateToped(goodId,toped) > 0;
    }

    @Override
    @Transactional(isolation = Isolation.REPEATABLE_READ,propagation = Propagation.REQUIRED)
    public boolean updateRecomed(String goodId, String recomed) {
        return goodDAO.updateRecomed(goodId,recomed) > 0;
    }
}
