package com.flyme.dao;

import java.util.List;

import com.flyme.entity.Product;

public class ProductDao extends BaseDao<Product> {
	public List<Product> getAllProduct() {
		List<Product> list = super.executeQuery("select * from fm_Product", null);
		return list;
	}

	public List<Product> getProductByProductID(Product product) {
		List<Product> list = super.executeQuery("select * from fm_Product where ProductID = ?",
				new Object[] { product.getProductID() });
		return list;
	}

	// 按编号获得信息
	public List<Product> getProductByProductID(int n) {
		List<Product> list = super.executeQuery("select * from fm_Product where ProductID = ?", new Object[] { n });
		return list;
	}

	public static void main(String[] args) {
		new ProductDao().getAllProduct();
	}

}
