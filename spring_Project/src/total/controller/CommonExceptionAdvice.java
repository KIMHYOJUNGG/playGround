
package total.controller;


import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

//@ControllerAdvice
public class CommonExceptionAdvice {


/*  @ExceptionHandler(Exception.class)
  public String common(Exception e) {

    System.out.println(e.toString());

    return "error_common";
  }
*/

  /*@ExceptionHandler(Exception.class)
  private ModelAndView errorModelAndView(Exception ex) {

    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("/board/error_common");
    modelAndView.addObject("exception", ex);

    return modelAndView;

  }
 */

}


