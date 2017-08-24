package com.flyme.dao;

import java.util.List;

import com.flyme.entity.Customer;

public class CustomerDao extends BaseDao<Customer> {

	/**
	 * 注册新用户, 返回是否注册成功
	 * 
	 * @param customer
	 * @return
	 */
	public boolean register(Customer customer) {
		boolean isExists = checkUser(customer);
		if (!isExists) { // 数据库无记录,则执行执行注册代码
			int result = 0;
			result = executeUpdate(
					"insert into fm_customer(CallName, CustomPass, Email, CustomSex, FoundDate, State) values(?,?,?,?,?,?);",
					new Object[] { customer.getCallName(), customer.getCustomPass(), customer.getEmail(),
							customer.getCustomSex(), customer.getFoundDate(), customer.getState() });
			return result == 1 ? true : false;
		} else {
			return false;
		}
	}

	/**
	 * 返回一个 boolean 对象: 检查 customer 是否存在
	 * 
	 * @param customer
	 * @return
	 */
	public boolean checkUser(Customer customer) {
		List<Customer> list = executeQuery("select * from fm_customer where callName = ? and CustomPass = ?;",
				new Object[] { customer.getCallName(), customer.getCustomPass() });
		return list.size() > 0 ? true : false;

	}
	

	/**
	 * 根据用户名查找用户信息
	 * @param customer
	 * @return
	 */
	public Customer getuserDetilWithName(String CallName) {
		List<Customer> list = executeQuery("select * from fm_customer where callName = ? ;",
				new Object[] { CallName});
		return list.get(0); // 获得list的第一个Customer对象
	}
	
	/**
	 * 根据用户名查找用户ID
	 * @param customer
	 * @return
	 */
	public int getCustomerID(Customer customer) {
		List<Customer> list = executeQuery("select c.CustomerID from fm_customer c where callName = ? ;",
				new Object[] { customer.getCallName()});
		return list.get(0).getCustomerID(); // 获得list的第一个Customer对象 ID
	}
	/**
	 * 根据用户ID获取用户信息
	 * @param n
	 * @return
	 */
	public List<Customer> getuserDetilWithID(int n){
		List<Customer> list = super.executeQuery("select * from fm_customer where CustomerID = ?",new Object[]{n});
		return list;
	}

	@SuppressWarnings("unused")
	public boolean addNewCustomer(Customer customer) {
		return false;
	}

	public boolean delectCurrentCustomer() {

		return false; // 删除失败
	}

	public void selectCustomerInfoWithID(int id) {
			
	}

	public void selectCustomerInfos(Customer customer) {
			customer.getEmail();
	}

	// sql = 'UPDATE runoob_tbl SET runoob_title="学习 Python" WHERE runoob_id=3';

	public boolean updateCustomerInfo(Customer customer) {
		// int result = executeUpdate("update table fm_Coustomer set ", param)
		return false;
	}
}
