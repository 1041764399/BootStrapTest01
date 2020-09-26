package com.ycy.service.impl;

import com.github.pagehelper.PageHelper;
import com.ycy.dao.UserDao;
import com.ycy.service.UserService;
import com.ycy.vo.PageVo;
import com.ycy.vo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao dao;


    @Override
    public Users login(Users users) {
        return dao.login(users);
    }

    @Override
    public int register(Users users) {
        return dao.register(users);
    }

    @Override
    public PageVo<Users> query(Users users, int rows, int page) {
        PageVo<Users> pageVo = new PageVo<>();
        PageHelper.startPage(page, rows);
        pageVo.setRows(dao.query(users));
        pageVo.setTotal(dao.queryTotal(users));
        return pageVo;
    }

    @Override
    public Users queryById(int id) {
        return dao.queryById(id);
    }

    @Override
    public int delete(int id) {
        return dao.delete(id);
    }

    @Override
    public int update(Users user) {
        return dao.update(user);
    }
}
