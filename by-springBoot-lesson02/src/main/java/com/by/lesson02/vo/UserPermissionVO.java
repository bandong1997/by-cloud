package com.by.lesson02.vo;

import lombok.Data;

/**
 * @author bandd
 * @date2026年03月18日10:26
 */
@Data
public class UserPermissionVO {
    private String userId;
    private String realName;
    private String email;
    private String phone;
    private String roleCode;
    private String roleName;
    private String roleDesc;
    private String permissionCode;
    private String permissionName;
    private String permissionType;
}
