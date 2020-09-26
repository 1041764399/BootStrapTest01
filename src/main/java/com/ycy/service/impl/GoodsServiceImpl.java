package com.ycy.service.impl;

import com.github.pagehelper.PageHelper;
import com.ycy.dao.GoodsDao;
import com.ycy.service.GoodsService;
import com.ycy.vo.Goods;
import com.ycy.vo.PageVo;
import com.ycy.vo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    GoodsDao dao;

    @Override
    public List<Goods> query() {
        return dao.query(new Goods());
    }

}
