package com.briup.crm.dao;

import com.briup.crm.bean.CstCustomer;
import com.briup.crm.bean.CstCustomerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CstCustomerMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cst_customer
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    long countByExample(CstCustomerExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cst_customer
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    int deleteByExample(CstCustomerExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cst_customer
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    int deleteByPrimaryKey(Long custId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cst_customer
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    int insert(CstCustomer record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cst_customer
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    int insertSelective(CstCustomer record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cst_customer
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    List<CstCustomer> selectByExample(CstCustomerExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cst_customer
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    CstCustomer selectByPrimaryKey(Long custId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cst_customer
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    int updateByExampleSelective(@Param("record") CstCustomer record, @Param("example") CstCustomerExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cst_customer
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    int updateByExample(@Param("record") CstCustomer record, @Param("example") CstCustomerExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cst_customer
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    int updateByPrimaryKeySelective(CstCustomer record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cst_customer
     *
     * @mbg.generated Tue Dec 31 17:29:45 CST 2019
     */
    int updateByPrimaryKey(CstCustomer record);
}