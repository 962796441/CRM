package com.briup.crm.bean;

public class SysUser {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_user.usr_id
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    private Long usrId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_user.usr_name
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    private String usrName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_user.usr_password
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    private String usrPassword;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_user.usr_role_name
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    private String usrRoleName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_user.usr_flag
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    private Integer usrFlag;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_user.usr_role_id
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    private Long usrRoleId;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_user.usr_id
     *
     * @return the value of sys_user.usr_id
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    public Long getUsrId() {
        return usrId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_user.usr_id
     *
     * @param usrId the value for sys_user.usr_id
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    public void setUsrId(Long usrId) {
        this.usrId = usrId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_user.usr_name
     *
     * @return the value of sys_user.usr_name
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    public String getUsrName() {
        return usrName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_user.usr_name
     *
     * @param usrName the value for sys_user.usr_name
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    public void setUsrName(String usrName) {
        this.usrName = usrName == null ? null : usrName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_user.usr_password
     *
     * @return the value of sys_user.usr_password
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    public String getUsrPassword() {
        return usrPassword;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_user.usr_password
     *
     * @param usrPassword the value for sys_user.usr_password
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    public void setUsrPassword(String usrPassword) {
        this.usrPassword = usrPassword == null ? null : usrPassword.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_user.usr_role_name
     *
     * @return the value of sys_user.usr_role_name
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    public String getUsrRoleName() {
        return usrRoleName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_user.usr_role_name
     *
     * @param usrRoleName the value for sys_user.usr_role_name
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    public void setUsrRoleName(String usrRoleName) {
        this.usrRoleName = usrRoleName == null ? null : usrRoleName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_user.usr_flag
     *
     * @return the value of sys_user.usr_flag
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    public Integer getUsrFlag() {
        return usrFlag;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_user.usr_flag
     *
     * @param usrFlag the value for sys_user.usr_flag
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    public void setUsrFlag(Integer usrFlag) {
        this.usrFlag = usrFlag;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_user.usr_role_id
     *
     * @return the value of sys_user.usr_role_id
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    public Long getUsrRoleId() {
        return usrRoleId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_user.usr_role_id
     *
     * @param usrRoleId the value for sys_user.usr_role_id
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    public void setUsrRoleId(Long usrRoleId) {
        this.usrRoleId = usrRoleId;
    }
}