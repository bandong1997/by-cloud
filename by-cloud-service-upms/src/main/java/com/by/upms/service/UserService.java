package com.by.upms.service;


import com.by.common.dto.LoginDTO;
import com.by.common.dto.LoginResultDTO;
import com.by.upms.entity.SysUser;
import jakarta.servlet.http.HttpServletRequest;

public interface UserService {
    LoginResultDTO login(LoginDTO loginDTO, HttpServletRequest request);
    void logout(String token);
    SysUser getUserInfo(Long userId);
    boolean register(SysUser user);
    boolean updatePassword(Long userId, String oldPassword, String newPassword);
}