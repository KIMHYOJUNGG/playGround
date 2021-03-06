package total.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import total.domain.BoardVO;
import total.domain.Criteria;
import total.domain.PageMaker;
import total.domain.SearchCriteria;
import total.service.BoardService;

@Controller
@RequestMapping("/sboard/*")
public class BoardSearchController {


  @Autowired
  private BoardService service;

  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public String listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

    System.out.println(cri.toString());

    // model.addAttribute("list", service.listCriteria(cri));
    model.addAttribute("list", service.listSearch(cri));

    PageMaker pageMaker = new PageMaker();
    pageMaker.setCri(cri);

    // pageMaker.setTotalCount(service.listCountCriteria(cri));
    pageMaker.setTotalCount(service.listSearchCount(cri));

    model.addAttribute("pageMaker", pageMaker);
    model.addAttribute("body", "list.jsp");
    return "t_sboard";
  }

  @RequestMapping(value = "/readPage", method = RequestMethod.GET)
  public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") SearchCriteria cri, Model model)
      throws Exception {

    model.addAttribute(service.read(bno));
  }
/*
  @RequestMapping(value = "/removePage", method = RequestMethod.POST)
  public String remove(@RequestParam("bno") int bno, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

    service.remove(bno);

    rttr.addAttribute("page", cri.getPage());
    rttr.addAttribute("perPageNum", cri.getPerPageNum());
    rttr.addAttribute("searchType", cri.getSearchType());
    rttr.addAttribute("keyword", cri.getKeyword());

    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/sboard/list";
  }

  @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
  public void modifyPagingGET(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

    model.addAttribute(service.read(bno));
  }

  @RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
  public String modifyPagingPOST(BoardVO board, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

    logger.info(cri.toString());
    service.modify(board);

    rttr.addAttribute("page", cri.getPage());
    rttr.addAttribute("perPageNum", cri.getPerPageNum());
    rttr.addAttribute("searchType", cri.getSearchType());
    rttr.addAttribute("keyword", cri.getKeyword());

    rttr.addFlashAttribute("msg", "SUCCESS");

    logger.info(rttr.toString());

    return "redirect:/sboard/list";
  }

  @RequestMapping(value = "/register", method = RequestMethod.GET)
  public void registGET() throws Exception {

    logger.info("regist get ...........");
  }

  @RequestMapping(value = "/register", method = RequestMethod.POST)
  public String registPOST(BoardVO board, RedirectAttributes rttr) throws Exception {

    logger.info("regist post ...........");
    logger.info(board.toString());

    service.regist(board);

    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/sboard/list";
  }
*/
/*  
  @RequestMapping(value = "/listPage", method = RequestMethod.GET)
  public String listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {

   System.out.println(cri.toString());

    model.addAttribute("list", service.listCriteria(cri));
    PageMaker pageMaker = new PageMaker();
    pageMaker.setCri(cri);
     //pageMaker.setTotalCount(131);

    pageMaker.setTotalCount(service.countPaging(cri));

    model.addAttribute("pageMaker", pageMaker);
    model.addAttribute("body", "listPage.jsp");
    return "t_board";
  }*/
  
 /*  @RequestMapping(value = "/list", method = RequestMethod.GET)
   public String listPage(@ModelAttribute("cri") SearchCriteria cri,
   Model model) throws Exception {
  
	   System.out.println(cri.toString());
  
   model.addAttribute("list", service.listSearch(cri));
  
   PageMaker pageMaker = new PageMaker();
   pageMaker.setCri(cri);
  
   pageMaker.setTotalCount(service.listSearchCount(cri));
  
   model.addAttribute("pageMaker", pageMaker);
   model.addAttribute("body", "list.jsp");
   return "t_sboard";
   }*/
}
