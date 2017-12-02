package com.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.test.dao.TestMapper;
import com.test.entity.Test;
import com.test.entity.TestExample;
import com.test.entity.TestExample.Criteria;

@Controller
@RequestMapping("/item")
public class TestController {
	@Autowired
	TestMapper testMapper;

	@RequestMapping("/")
	public String index(String search, @RequestParam(defaultValue = "1") Integer curr,
			@RequestParam(defaultValue = "5") Integer pageSize, Model m) {
		TestExample example = new TestExample();
		if (search != null && !search.equals("")) {
			Criteria c = example.createCriteria();
			m.addAttribute("search", search);
			c.andNameLike("%" + search + "%");
		}
		PageHelper.startPage(curr, pageSize);
		List<Test> lists = testMapper.selectByExample(example);
		PageInfo<Test> pageInfo = new PageInfo<>(lists);
		m.addAttribute("p", pageInfo);
		return "test";
	}

	@RequestMapping(value = "/add_edit", method = RequestMethod.POST)
	public void addTest(Test t) {
		if (t.getId() == null) {
			testMapper.insert(t);
		} else {
			testMapper.updateByPrimaryKey(t);
		}
	}

	@RequestMapping(value = "/edit/{id}")
	public String toEdit(@PathVariable Integer id, Model m) {
		Test t = testMapper.selectByPrimaryKey(id);
		m.addAttribute("t", t);
		return "test-add";
	}

}
