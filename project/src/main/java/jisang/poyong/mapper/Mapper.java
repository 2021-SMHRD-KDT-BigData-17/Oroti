package jisang.poyong.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;
import jisang.poyong.entity.User;
// DAO 임 

public interface Mapper {

	@Insert("insert into user_info(user_id, user_pw, user_name, user_address, user_phone, indate, pw) values(TMember_seq.nextval, #{name}, #{nick}, #{email}, #{address}, sysdate, #{pw})")
	public void User(User vo);

}	

