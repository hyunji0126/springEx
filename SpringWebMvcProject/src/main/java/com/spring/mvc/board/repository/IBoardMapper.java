package com.spring.mvc.board.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.mvc.board.commons.PageVo;
import com.spring.mvc.board.commons.SearchVO;
import com.spring.mvc.board.model.BoardVO;

// 게시관 관련 CRUD 추상 메서드 선언.(Create Read Update Delete)
public interface IBoardMapper {
	// 게시글 등록 기능
	void insert(BoardVO article);

	// 게시글 전체 조회 기능
//	List<BoardVO> getArticleList(PageVo paging, String keyword, String condition);
	List<BoardVO> getArticleList(SearchVO search);

	// 게시글 상세 조회 기능
	BoardVO getArticle(int boardNo);

	// 게시글 수정 기능
	void update(BoardVO article);

	// 게시글 삭제 기능
	void delete(int boardNo);

	//	게시물 수 조회 기능
//	int countArticles(@Param("keyword") String keyword, @Param("title") String title);
	int countArticles(SearchVO search);
}
