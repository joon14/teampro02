package com.project.ctrl;

import java.io.File;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.biz.QnaService;
import com.project.domain.Qna;

@Controller
@RequestMapping("/qna/")
public class QnaController {

	private static final Logger log = LoggerFactory.getLogger(ProductController.class);

	 @Autowired
	 private QnaService qnaService;
	 
	 @Autowired
	private HttpSession session;
	 
	 @GetMapping("qnaList.do")
	 public String getQnaList(Model model) {
        List<Qna> qnaList = qnaService.getQnaList();
        model.addAttribute("qnaList", qnaList);
        return "qna/qnaList";
    }
	 
	 @GetMapping("insQna.do")
	    public String insQnaForm(Qna qna, Model model) {
	        return "qna/insQna";
    }

	 
	 
	public String saveFile(MultipartFile file, String uploadDir) throws IOException {
			String originalFilename = file.getOriginalFilename();
			String newFilename = UUID.randomUUID().toString() + "_" + originalFilename;
			File serverFile = new File(uploadDir + newFilename);
			file.transferTo(serverFile);
			return newFilename;
		}
	 
	 
    @PostMapping("insQna.do")//나중에 경로 다시 설정해야함 각 항목별로 파일폴더 만들기!
    public String insQna(
    		Model model,
    		HttpServletRequest request,
    		@RequestParam("qimg1") MultipartFile qimg1,
    		@RequestParam("qimg2") MultipartFile qimg2,
    		@RequestParam("qcate") String qcate,
    		@RequestParam("title") String title,
    		@RequestParam("content") String content
    		
    		) {
    	String uploadDir = request.getServletContext().getRealPath("/resources/upload/");
	    File dir = new File(uploadDir);
    	
	    String img1Name = "", img2Name = "";
    	
	    if (!dir.exists()) {
	        dir.mkdirs();
	    }
	    
	    try {
	        if (!qimg1.isEmpty()) {
	            img1Name = saveFile(qimg1, uploadDir);
	            log.info("업로드 파일1 이름 : {}", img1Name);
	        }
	        if (!qimg2.isEmpty()) {
	            img2Name = saveFile(qimg2, uploadDir);
	            log.info("업로드 파일2 이름 : {}", img2Name);
	        }
	    } catch (IOException e) {
	        log.error("예외 : {}", e);
	    }
	    
	    
	    Qna qna = new Qna();
    	String id = (String) session.getAttribute("sid");
		String name = (String) session.getAttribute("sname");
		qna.setQcate(qcate);
		qna.setQimg1(img1Name);
		qna.setQimg2(img2Name);
		qna.setTitle(title);
		qna.setContent(content);
		qna.setId(id);
		qna.setName(name);
		qna.setResdate(new Date());
		qnaService.insQna(qna);
		return "redirect:/qna/qnaList.do";
    }
    
    @GetMapping("getQna.do")
    public String getQna(@RequestParam("no") int no, Model model) {
        Qna qna = qnaService.getQna(no);
        String sid = (String) session.getAttribute("sid");
        List<Qna> answerList = qnaService.getAnswers(no); // 답변 리스트 가져오기
        log.info("Qna : {}", qna);
        model.addAttribute("qna", qna);
        model.addAttribute("answerList", answerList); // 답변 리스트 추가
        model.addAttribute("sid",sid);
        return "qna/getQna";
    }
    
    @PostMapping("upQna.do")
    public String upQnaForm(@RequestParam("no") int no, 
    		Model model,HttpServletRequest request,
    		@RequestParam("qimg1") MultipartFile qimg1,
    		@RequestParam("qimg2") MultipartFile qimg2,
    		@RequestParam("title") String title,
    		@RequestParam("content") String content
    		
    		
    		) {
    	Qna before = qnaService.getQna(no);
    	model.addAttribute("qna",before);
    	
	    String uploadDir = request.getServletContext().getRealPath("/resources/upload/");
	    File dir = new File(uploadDir);
	    
	    String img1Name = "", img2Name = "";
    	
	    if (!dir.exists()) {
	        dir.mkdirs();
	    }
	    
	    try {
	        if (!qimg1.isEmpty()) {
	            img1Name = saveFile(qimg1, uploadDir);
	            log.info("변경 파일1 이름 : {}", img1Name);
	        } else {
	        	img1Name = before.getQimg1();
	        }
	        if (!qimg2.isEmpty()) {
	            img2Name = saveFile(qimg2, uploadDir);
	            log.info("변경 파일2 이름 : {}", img2Name);
	        } else {
	        	img2Name = before.getQimg2();
	        }
	    } catch (IOException e) {
	        log.error("예외 : {}", e);
	    }
	    
	    before.setQimg1(img1Name);
	    before.setQimg2(img2Name);
	    before.setTitle(title);
		before.setContent(content);
		
       qnaService.upQna(before);
       
       return "redirect:/qna/getQna.do?no=" + before.getNo();
    }

    @GetMapping("upQna.do")
    public String upQna(@RequestParam("no") int no, Model model) {
        Qna qna = qnaService.getQna(no);
    	model.addAttribute("qna",qna);
    	return "qna/upQna";
    }
    

    @GetMapping("delQna.do")
    public String delQna(@RequestParam("no") int no) {
        qnaService.delQna(no);
        return "redirect:qnaList.do";
    }

    @GetMapping("insAnswer.do")
    public String insQnaAnswerForm(@RequestParam("parno") int parno, Model model) {
        model.addAttribute("parno", parno);
        return "qna/insQnaAnswer";
    }

    @PostMapping("insAnswer.do")
    public String insQnaAnswer(
    		HttpSession session,
            @RequestParam("pimg1") MultipartFile pimg1,
    		@RequestParam("pimg2") MultipartFile pimg2,
    		@RequestParam("title") String title,
    		@RequestParam("content") String content,
    		@RequestParam("parno") int parno,
    		HttpServletRequest request) {

    	
		String uploadDir = request.getServletContext().getRealPath("/resources/upload/");
	    File dir = new File(uploadDir);
	    String img3Name = "", img4Name = "";
    	
	    if (!dir.exists()) {
	        dir.mkdirs();
	    }
	    
	    try {
	        if (!pimg1.isEmpty()) {
	        	img3Name = saveFile(pimg1, uploadDir);
	            log.info("업로드 파일1 이름 : {}", img3Name);
	        }
	        if (!pimg2.isEmpty()) {
	        	img4Name = saveFile(pimg2, uploadDir);
	            log.info("업로드 파일2 이름 : {}", img4Name);
	        }
	    } catch (IOException e) {
	        log.error("예외 : {}", e);
	    }

	    Qna qna = new Qna();
        qna.setPresdate(new Date());
        String id = (String) session.getAttribute("sid");
		String name = (String) session.getAttribute("sname");
		qna.setId(id);
		qna.setName(name);
		qna.setPimg1(img3Name);
		qna.setPimg2(img4Name);
		qna.setContent(content);
		qna.setTitle(title);
		qna.setParno(parno);
		
		String sid = (String) session.getAttribute("sid");
        if ("admin".equals(sid)) { // 관리자인지 확인
            qna.setId(sid);
            qnaService.insQna(qna);
        }
		
        return "redirect:/qna/getQna.do?no=" + qna.getParno();
    }
    
 
    
}
