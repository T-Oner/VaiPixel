package com.emrys.vaipixel.db.dao.user.imp;

import com.emrys.vaipixel.db.dao.user.IUserDao;
import com.emrys.vaipixel.db.mapper.UserMapper;
import com.emrys.vaipixel.db.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserDaoImp implements IUserDao {

    private UserMapper userMapper;

    @Autowired
    public UserDaoImp(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public boolean isUserExist(User user) {
        return user != null && userMapper.getUserById(user.getId()) != null;
    }

    @Override
    public boolean isUserExist(long userId) {
        return userMapper.getUserById(userId) != null;
    }

    @Override
    public User getUserById(long userId) {
        return userMapper.getUserById(userId);
    }

    @Override
    public void addUser(User user) {
        userMapper.addUser(user);
    }

    @Override
    public User getUserInfoByCond(String userName, String password) {
        return userMapper.getUserInfoByCond(userName, password);
    }
}
