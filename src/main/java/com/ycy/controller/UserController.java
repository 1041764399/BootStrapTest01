package com.ycy.controller;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.ycy.service.UserService;
import com.ycy.vo.PageVo;
import com.ycy.vo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService service;

    //查所有
    @RequestMapping(value = "/query.action")
    @ResponseBody
    public PageVo<Users> query(Users user,
                               @RequestParam(value = "rows", defaultValue = "10") int rows,
                               @RequestParam(value = "page", defaultValue = "1") int page) {
        return service.query(user, rows, page);
    }

    //根据id查询
    @RequestMapping("/queryById.action")
    @ResponseBody
    public Users query(int uid) {
        return service.queryById(uid);
    }

    //登录
    @RequestMapping("/login.action")
    @ResponseBody
    public boolean login(Users users, HttpSession session) {
        Users u = service.login(users);
        if (u != null) {
            session.setAttribute("user", u);
        }
        return u != null;
    }

    //注册
    @RequestMapping(value = "/register.action")
    @ResponseBody
    public boolean register(Users users) {
        int num = service.register(users);
        return num > 0;
    }

    //修改
    @RequestMapping(value = "/update.action")
    @ResponseBody
    public boolean update(Users user) {
        int row = service.update(user);
        return row > 0;
    }

    //删除
    @RequestMapping(value = "/delete.action")
    @ResponseBody
    public boolean delete(Integer uid) {
        int row = service.delete(uid);
        return row > 0;
    }

}
