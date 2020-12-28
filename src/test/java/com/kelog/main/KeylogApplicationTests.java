package com.kelog.main;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import keyLog.dao.UserMapper;
import keyLog.dto.UserDto;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
class KeylogApplicationTests {
	
	@Autowired
    private UserMapper uMapper;
	
	@Test
    public void userTest() {
        UserDto user = new UserDto();
        user.setUserId("test");
        user.setUserPw("test");
        user.setUserName("테스트");
        uMapper.insertUser(user);
        
        System.out.println(uMapper.selectOneUser("test"));
    }

}
