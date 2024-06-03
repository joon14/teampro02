package com.project.per;

import java.util.List;

import com.project.domain.Product;

public interface ProductDAO {
	public int getTotalCount();
	public List<Product> getProductList();
	public List<Product> getProductCateList(String pcate);
	public Product getProduct(int pno);
	public void insProduct(Product product);
	public void upProduct(Product product);
	public void delProduct(int pno);
}
