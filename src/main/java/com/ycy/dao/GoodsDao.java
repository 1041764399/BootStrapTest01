package com.ycy.dao;

import com.ycy.vo.Goods;

import java.util.List;

public interface GoodsDao {

    //查询
    public List<Goods> query(Goods goods);

    //查询条数
    public int queryTotal(Goods goods);

}
