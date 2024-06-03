package com.project.biz;

import java.util.List;

import com.project.domain.Product;


public interface ProductService {
	public int getTotalCount();
	public List<Product> getProductList();
	public List<Product> getProductCateList(String pcate);
	public Product getProduct(int pno);
	public void insProduct(Product product);
	public void upProduct(Product product);
	public void delProduct(int pno);
}
