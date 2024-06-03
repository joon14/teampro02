package com.project.per;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.domain.Faq;

@Repository
public class FaqDAOImpl implements FaqDAO {

	@Autowired
	private	SqlSession sqlSession; 
	
	@Override
	public List<Faq> getFaqList() {
		return sqlSession.selectList("faq.getFaqList");
	}

	@Override
	public Faq getFaq(int fno) {
		return sqlSession.selectOne("faq.getFaq",fno);
	}

	@Override
	public void insFaq(Faq faq) {
		sqlSession.insert("faq.insFaq",faq);
	}

	@Override
	public void upFaq(Faq faq) {
		sqlSession.update("faq.upFaq",faq);
	}

	@Override
	public void delFaq(int fno) {
		sqlSession.delete("faq.delFaq",fno);
	}

	
}
