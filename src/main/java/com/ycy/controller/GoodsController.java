package com.ycy.controller;

import com.ycy.service.GoodsService;
import com.ycy.vo.Goods;
import com.ycy.vo.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/goods")
public class GoodsController {
    @Autowired
    GoodsService service;

    //查所有
    @RequestMapping(value = "/query.action")
    @ResponseBody
    public List<Goods> query() {
        return service.query();
    }


}
