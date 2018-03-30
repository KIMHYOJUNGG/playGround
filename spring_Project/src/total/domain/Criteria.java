package total.domain;

public class Criteria {

  private int page;
  private int perPageNum;
  private String type;
 /* private int endRowId;
  private int startRowId;*/

  public Criteria() {
    this.page = 1;
    this.perPageNum = 10;
    
    /*int endRowId = page * 10;
	int startRowId = endRowId - 9;*/
  }

  public void setType(String type) {
	  
	  this.type=type;
	  
  }
  public String getType() {
	  return this.type;
  }
  public void setPage(int page) {

    if (page <= 0) {
      this.page = 1;
      return;
    }

    this.page = page;
  }

  public void setPerPageNum(int perPageNum) {

    if (perPageNum <= 0 || perPageNum > 100) {
      this.perPageNum = 10;
      return;
    }

    this.perPageNum = perPageNum;
  }

  public int getPage() {
    return page;
  }

  // method for MyBatis SQL Mapper -
  public int getPageStart() {

    return page * 10 - 9;
  }

  // method for MyBatis SQL Mapper
  public int getPerPageNum() {
	  
    return page * 10;
	
  }

@Override
public String toString() {
	return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", type=" + type + "]";
}

  
}
