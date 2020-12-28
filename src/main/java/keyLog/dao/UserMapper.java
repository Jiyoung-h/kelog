package keyLog.dao;

import java.util.List;

import keyLog.dto.UserDto;

public interface UserMapper {
	public void insertUser (UserDto user);
	public List<UserDto> selectAllUser();
	public UserDto selectOneUser (String userId);
}
