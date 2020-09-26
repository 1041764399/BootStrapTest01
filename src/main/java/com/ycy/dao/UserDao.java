package com.ycy.dao;

import com.ycy.vo.Users;

import java.util.List;

public interface UserDao {
    //登录
    public Users login(Users users);

    //注册
    public int register(Users users);

    //查询
    public List<Users> query(Users user);

    //查询条数
    public int queryTotal(Users user);

    //根据id查询
    public Users queryById(int id);

    //删除
    public int delete(int id);

    //修改
    public int update(Users user);

}
