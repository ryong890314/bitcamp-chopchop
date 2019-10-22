package bitcamp.chopchop.dao;

import java.util.List;
import bitcamp.chopchop.domain.Comment;

public interface CommentDao {
  int insert(Comment comment) throws Exception;
  List<Comment> findAll() throws Exception;
  Comment findBy(int commentNo) throws Exception;
  Comment findByProductWith(int commnetNo) throws Exception;
  int update(Comment comment) throws Exception;
  int commentDelete(int commnetNo) throws Exception;
}
