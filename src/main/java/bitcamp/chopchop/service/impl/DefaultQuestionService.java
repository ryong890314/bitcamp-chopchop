package bitcamp.chopchop.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import bitcamp.chopchop.dao.QuestionDao;
import bitcamp.chopchop.domain.Question;
import bitcamp.chopchop.service.QuestionService;

@Service
public class DefaultQuestionService implements QuestionService {

  @Resource
  private QuestionDao questionDao;
  
  @Override
  public List<Question> list() throws Exception {
    return questionDao.findAll();
  }

  @Override
  public void insert(Question question) throws Exception {
    questionDao.insert(question);
  }

  @Override
  public Question get(int no) throws Exception {
    Question question = questionDao.findBy(no);
    if (question == null) {
      throw new Exception("해당 번호의 데이터가 없습니다.");
    }
    return question;
  }

  @Override
  public void update(Question question) throws Exception {
    questionDao.update(question);
  }

  @Override
  public void delete(int no) throws Exception {
    if (questionDao.delete(no) == 0) {
      throw new Exception("해당 데이터가 없습니다.");
    }
  }

}
