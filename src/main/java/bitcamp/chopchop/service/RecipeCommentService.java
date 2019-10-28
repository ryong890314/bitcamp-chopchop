package bitcamp.chopchop.service;

import java.util.List;
import bitcamp.chopchop.domain.RecipeComment;

// 역할:
// => 게시물 관리 업무를 수행
// => 트랜잭션 제어
// => 여러 페이지 컨트롤러가 사용한다.
//
public interface RecipeCommentService {
  List<RecipeComment> list() throws Exception;
  RecipeComment get(int no) throws Exception;
  void insert(RecipeComment recipeComment) throws Exception;
  void update(RecipeComment recipeComment) throws Exception;
  void delete(int no) throws Exception;
}










