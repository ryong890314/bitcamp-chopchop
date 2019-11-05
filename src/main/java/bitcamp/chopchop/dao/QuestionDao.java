package bitcamp.chopchop.dao;

import java.util.List;
import bitcamp.chopchop.domain.Question;

public interface QuestionDao {
  List<Question> findAll() throws Exception;
  int insert(Question question) throws Exception;
  Question findBy(int no) throws Exception;
  int update(Question question) throws Exception;
  int delete(int no) throws Exception;
}
