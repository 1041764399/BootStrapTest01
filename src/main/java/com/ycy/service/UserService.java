package com.ycy.service;

import com.ycy.vo.PageVo;
import com.ycy.vo.Users;

import java.util.List;

public interface UserService {
    //登录
    public Users login(Users users);

    //注册
    public int register(Users users);

    //查询
    public PageVo<Users> query(Users user, int rows, int page);

    //根据id查询
    public Users queryById(int id);

    //删除
    public int delete(int id);

    //修改
    public int update(Users user);
}
