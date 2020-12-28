package keyLog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import keyLog.dao.UserMapper;
import keyLog.dto.UserDto;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
    private UserMapper uMapper;
	
	@Override
	public List<UserDto> getUserList() {
		return uMapper.selectAllUser();
	}

}
