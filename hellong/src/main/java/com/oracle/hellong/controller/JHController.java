package com.oracle.hellong.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.hellong.dao.jhdao.MemberGSGymOrderReviewJoinDao;
import com.oracle.hellong.model.GS;
import com.oracle.hellong.model.GSDetail;
import com.oracle.hellong.model.GSGSDetailJoin;
import com.oracle.hellong.model.Gym;
import com.oracle.hellong.model.GymBoard;
import com.oracle.hellong.model.GymBoardFile;
import com.oracle.hellong.model.GymBoardJoin;
import com.oracle.hellong.model.GymBoardReviewJoin;
import com.oracle.hellong.model.GymBoardFileServiceReviewJoin;
import com.oracle.hellong.model.GymMemberServiceOrderJoin;
import com.oracle.hellong.model.GymReview;
import com.oracle.hellong.model.Member;
import com.oracle.hellong.model.MemberGSGymOrderReviewJoin;
import com.oracle.hellong.model.MemberGym;
import com.oracle.hellong.model.Trainer;
import com.oracle.hellong.service.jh.JHService;
import com.oracle.hellong.service.jh.Paging;
import com.oracle.hellong.service.jm.JMService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class JHController { 
	private final JHService jh;
	private final JMService jm;
		
	
	@RequestMapping(value="listGym")
	public String gymList(Gym gym, Model model) {
		int totalGym = jh.totalGym();
		
		Paging page = new Paging(totalGym,gym.getCurrentPage());

		gym.setStart(page.getStart());	
		gym.setEnd(page.getEnd());		
		
		List<Gym>listGym = jh.listGym(gym);
		
		model.addAttribute("totalGym",totalGym);
		model.addAttribute("listGym",listGym);
		model.addAttribute("page",page );
		
		return "jh/list";
	}
	
	// 체육관이 승인된 회원************************************************************************************************************
	@RequestMapping(value="confirmedGymMember")
	public String gymList(MemberGym memberGym, Model model) {
		int totalGym = jh.totalConfirmed();
		Paging page = new Paging(totalGym,memberGym.getCurrentPage());
		memberGym.setStart(page.getStart());	
		memberGym.setEnd(page.getEnd());		
		List<MemberGym>listMember = jh.listGym(memberGym);
		model.addAttribute("listMember",listMember);
		model.addAttribute("page",page );
		return "jh/confirmedMemberList";
	}
	
	
	// 관리 헬스장 리스트 불러오기**********************************************************************************************************
	@GetMapping(value = "listGymManager")
	public String gymManager(HttpSession session, Gym m_id, Model model) {	
		if (session.getAttribute("m_number") != null) { // 로그인되어있을때
			Member member = new Member();
			member = jm.jmGetMemberFromId((String) session.getAttribute("m_id"));	
			System.out.println(member);
			List<Gym>ManageList = jh.manageList(member.getM_number());
			if(ManageList.size()>0) {
				model.addAttribute("ManageList",ManageList);		 
				return "jh/gymManager";
			}else {
				return "redirect:/authenticate";
			}		
		} else {
			return "jm/jmLoginForm";
		}
			
	}
	
	
	/*@GetMapping(value = "listGymManager")
	public String gymManager(HttpSession session, Gym m_id, Model model) {	
			Member member = new Member();
			member = jm.jmGetMemberFromId((String) session.getAttribute("m_id"));	
			System.out.println(member);
			List<Gym>ManageList = jh.manageList(m_id.getM_number());
			
				model.addAttribute("ManageList",ManageList);		 
				return "jh/gymManager";
		
		
	}*/
	
	
	// 관리헬스장 홍보글 등록/수정 화면 이동********************************************************************************************************
	@GetMapping(value = "createGymForm")
	public String createGymPost(HttpSession session, Gym g_id, Model model) {
		if (session.getAttribute("m_number") != null) { // 로그인되어있을때
			Member member = new Member();
			member = jm.jmGetMemberFromId((String) session.getAttribute("m_id"));
			System.out.println("JHController createGymPost start");
			String rtn = "";
			// gymBoard id 조회 => GymBoard에 글이 등록되어 있는지 확인 => 1대1 관계이므로....
			int gymForm = jh.gymForm(g_id);
			List<Gym> gymDetail = jh.createGymPost(g_id.getG_id());
			List<GymBoard> gymBoardDetail = jh.gymBoardDetail(g_id);
			if(gymForm == 0) {
				System.out.println("JHController createGymPost start");
				model.addAttribute("gymDetail",gymDetail);
				rtn = "jh/createGymPost";
			}
			else {	// 글이 있을 경우=>수정 폼 이동
				System.out.println("JHController updateGymPost start");
				List<GymBoardFile> gbf_idList = jh.gbf_idList(g_id);
				model.addAttribute("fileList",gbf_idList);
				model.addAttribute("gymDetail",gymDetail);
				model.addAttribute("gymBoardDetail",gymBoardDetail);
				rtn = "jh/updateGymPost";
			}		
			return rtn;
		} else {
			return "jm/jmLoginForm";
		}	
		
	}
	
	

	// 헬스장 홍보 글 저장/수정/삭제****************************************************************************************************************
	@PostMapping(value = "/jh/saveGymForm")
	public String saveGymPost(GymBoard gymboard,Gym gym) throws IOException {
	    jh.saveGymPost(gymboard,gym);
	    System.out.println(gymboard);
	    return "redirect:/listGymManager?m_number="+gym.getM_number();
	}

	
	@PostMapping(value = "/jh/updateGymForm")
	public String updateGymForm(GymBoardFile gbf,GymBoard gymboard,Gym gym) throws IOException {
	    jh.updateGymPost(gymboard,gym);
	    return "redirect:/listGymManager?m_number="+gym.getM_number();
	}

	@GetMapping(value = "deleteGymPost")
	public String deleteGymForm(GymBoard gymboard,Gym gym) throws IOException {
		jh.deleteGymPost(gymboard.getG_id());
		return "redirect:/listGymManager?m_number="+gym.getM_number();
	}	
	
	
	// 트레이너 리스트 *****************************************************************************************************

	@GetMapping(value = "trainerList")
	public String trainerList(HttpSession session,Gym gym, Trainer trainer,Model model) {
		if (session.getAttribute("m_number") != null) { // 로그인되어있을때
			Member member = new Member();
			member = jm.jmGetMemberFromId((String) session.getAttribute("m_id"));
			//trainerList 조회
			int totalGym = jh.totalTrainer(trainer.getG_id());
			Paging page = new Paging(totalGym,trainer.getCurrentPage());
			//추가버튼에 id 넘겨줌
			int gymId = jh.gymId(gym.getG_id());	
			trainer.setStart(page.getStart());	
			trainer.setEnd(page.getEnd());	
			System.out.println("JHController trainerList start");
			List<Trainer>trainerList = jh.trainerList(trainer);
			model.addAttribute("gym",gymId);
			model.addAttribute("page",page );
			model.addAttribute("trainerList",trainerList);
			return "jh/trainerList";	
		} else {
			return "jm/jmLoginForm";
		}
		
	}
	
	@GetMapping(value = "trainerCreate")
	public String trainerCreate(Gym gym, Model model) {
		int gymId = jh.gymId(gym.getG_id());
		model.addAttribute("gym",gymId);
		return "jh/createTrainer";
	}
	
	@PostMapping(value = "/jh/saveTrainerForm")
	public String trainerSave(Gym gym,Trainer trainer, Model model) throws IOException {
		System.out.println(gym.getG_id());
		int saveTrainer = jh.saveTrainer(trainer);
		List<Trainer> trainerId = jh.gymIdTrainerId(trainer);
		if (saveTrainer > 0) {
			model.addAttribute("trainer",trainerId);
			return "redirect:/trainerList?g_id="+gym.getG_id();
		}
		else {
			model.addAttribute("msg","입력 실패 확인해 보세요");
			return "jh/createTrainer";
		}
	}
	
    @GetMapping(value = "/getTrainerInfo/{trainer_id}")
    @ResponseBody
    public Trainer getTrainerInfo(@PathVariable("trainer_id") int trainerId) {
        Trainer trainerSelect = jh.getTrainerById(trainerId);
        return trainerSelect;
    }
    
    @GetMapping(value="/trainerUpdate/{t_id}")
    public String trainerUpdatePage(@PathVariable("t_id") int trainerId, Model model) {
    	Trainer trainerSelect = jh.getTrainerById(trainerId);
    	model.addAttribute("trainer",trainerSelect);
        return "jh/updateTrainer";
    }
    
    @PostMapping(value = "/jh/updateTrainerForm")
    public String trainerUpdateSet(Trainer trainer, Model model) throws IOException{
    	int updateTrainer = jh.updateTrainer(trainer);
		if (updateTrainer > 0) {
			return "redirect:/trainerList?g_id="+trainer.getG_id();
		}
		else {
			model.addAttribute("msg","입력 실패 확인해 보세요");
			return "jh/createTrainer";
		}
    }
    
       
    @PostMapping(value = "/deleteTrainer/{trainerId}")
    @ResponseBody
    public String deleteTrainer(@PathVariable("trainerId") int t_id) {
    	int trainerDelete = jh.getDeleteTrainer(t_id);
    	if (trainerDelete == 1) {
            return "trainerDelete successfully!";
        } else {
            return "Failed to trainerDelete!";
        }	
    }
    
	// 트레이너 검색
	@PostMapping(value="trainerSearch")
	public String trainerSearch(Trainer trainer, Model model) {
		int totaltrainerSearch = jh.getTotaltrainerSearch(trainer);
		Paging page = new Paging(totaltrainerSearch, trainer.getCurrentPage());
		trainer.setStart(page.getStart());
		trainer.setEnd(page.getEnd());
		List<Trainer> trainerSearchList = jh.getTrainerSearchList(trainer);
		model.addAttribute("gym",trainer.getG_id());
		model.addAttribute("page",page );
		model.addAttribute("trainerList",trainerSearchList);
		 return "jh/trainerList";
	}
	
    
	// 서비스(상품) 리스트 ****************************************************************************
	@GetMapping(value = "serviceList")
	public String serviceList(HttpSession session, Gym gym,GSDetail sd_number ,GS gs, Model model) {
		if (session.getAttribute("m_number") != null) { // 로그인되어있을때
			Member member = new Member();
			member = jm.jmGetMemberFromId((String) session.getAttribute("m_id"));
			int totalService = jh.totalService(gym.getG_id());
			Paging page = new Paging(totalService,gs.getCurrentPage());
			gs.setStart(page.getStart());
			gs.setEnd(page.getEnd());
			// 리스트 조회
			List<GSGSDetailJoin> serviceList = jh.serviceList(gs);
			// g_id 넘겨줄 것
			int gymId = jh.gymId(gym.getG_id());
			model.addAttribute("g_id",gymId);
			model.addAttribute("page",page);
			model.addAttribute("serviceList",serviceList);
		
			return "jh/serviceList";
		} else {
			return "jm/jmLoginForm";
		}
	}
	
	//서비스 추가
	@PostMapping(value = "jh/createService")
	@ResponseBody
	public String createService(HttpSession session,HttpServletRequest request) {
		if (session.getAttribute("m_number") != null) { // 로그인되어있을때
			Member member = new Member();
			member = jm.jmGetMemberFromId((String) session.getAttribute("m_id"));
			GS gs = new GS();
			gs.setG_id(Integer.parseInt(request.getParameter("g_id")));
			gs.setS_name(request.getParameter("s_name"));
			gs.setS_detail(request.getParameter("s_detail"));
			gs.setS_price(Integer.parseInt(request.getParameter("s_price")));
			gs.setS_period(Integer.parseInt(request.getParameter("s_period")));
			gs.setS_matters(request.getParameter("s_matters"));		
			int createService = jh.createService(gs);
			int createServiceDetail = jh.getCreateServiceDetail(gs);
	        if (createService == 1 && createServiceDetail==1) {
	            return "Service createService successfully!";
	        } else {
	            return "Failed to createService!";
	        }
		} else {
			return "jm/jmLoginForm";
		}
	}
	
	  @GetMapping(value = "jh/fetchServiceDetails/{sNumber}")
	  @ResponseBody
	  public GS fetchServiceDetails(@PathVariable("sNumber") int sNumber) {
		  GS fetchServiceDetails = jh.fetchServiceDetails(sNumber);
		  return fetchServiceDetails;
	  }
	
	//서비스 수정
	@PostMapping(value = "jh/updateService/{sNumber}")
    @ResponseBody
	public String updateService(@PathVariable("sNumber") int sNumber, HttpServletRequest request) {
		GS gs = new GS();
		gs.setS_number(sNumber);
		gs.setG_id(Integer.parseInt(request.getParameter("g_id")));
		gs.setS_name(request.getParameter("s_name"));
		gs.setS_detail(request.getParameter("s_detail"));
		gs.setS_price(Integer.parseInt(request.getParameter("s_price")));
		gs.setS_period(Integer.parseInt(request.getParameter("s_period")));
		gs.setS_matters(request.getParameter("s_matters"));
    	int updateServiceDetail = jh.updateServiceDetail(gs);
    	int updateService = jh.updateService(gs);
    	int createServiceDetail = jh.getCreateServiceDetail(gs);
        if (updateService == 1 && createServiceDetail==1 && updateServiceDetail==1 ) {
            return "Service updateService successfully!";
        } else {
            return "Failed to updateService!";
        }
	}
	
	//서비스 삭제
	@PostMapping(value="jh/deleteService/{sNumber}")
	@ResponseBody
	public String deleteService(@PathVariable("sNumber") int sNumber) {
		System.out.println(sNumber);
		int deleteService = jh.deleteService(sNumber);
		GS gs = new GS();
		gs.setS_number(sNumber);
		int updateServiceDetail = jh.updateServiceDetail(gs);
        if (deleteService == 1 && updateServiceDetail==1) {
            return "Service deleteService successfully!";
        } else {
            return "Failed to deleteService!";
        }	
	}
	
	// 서비스 검색
	@PostMapping(value="serviceSearch")
	public String searchService(GS gs,Model model) {
		int totalSearchService = jh.getTotalSearchService(gs);
		System.out.println(gs.getG_id());
		Paging page = new Paging(totalSearchService, gs.getCurrentPage());
		gs.setStart(page.getStart());
		gs.setEnd(page.getEnd());
		List<GSGSDetailJoin> listSearchService = jh.getListSearchService(gs);
		model.addAttribute("totalSearchService",totalSearchService);
		model.addAttribute("page",page);
		model.addAttribute("serviceList",listSearchService);
		model.addAttribute("g_id", gs.getG_id());
		 return "jh/serviceList";
	}
	
	
	
	// 헬스장 회원리스트***********************************************************************************
	@GetMapping(value = "gymMemberListDetail")
	public String gymMemberListDetail(HttpSession session, GymMemberServiceOrderJoin gymMember,Gym gym, Model model) {	
		if (session.getAttribute("m_id") != null) {
			//누적 회원수
			int totalGymMemberList = jh.getTotalGymMemberList(gym.getG_id());
			//page
			// 현재 이용 회원
			int currentTotalMemberList = jh.getCurrentTotalMemberList(gym.getG_id());
			Paging page = new Paging(currentTotalMemberList,gymMember.getCurrentPage());
			gymMember.setStart(page.getStart());
			gymMember.setEnd(page.getEnd());
			//회원리스트 조회
			gymMember.setG_id(gym.getG_id());
			System.out.println("************************"+gymMember);
			List<GymMemberServiceOrderJoin> gymMemberList = jh.getGymMemberList(gymMember);
			
			//누적 매출액
			int sumSale = jh.getSumSale(gym.getG_id());
			//남녀 성비
			Map<String,Double> genderRatio = jh.getGenderRatio(gym.getG_id());
			Map<String,Double> ageRatio = jh.getAgeRatio(gym.getG_id());
			System.out.println("ageRatio=>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+ageRatio);
			model.addAttribute("sumSale",sumSale);
			model.addAttribute("totalGymMemberList",totalGymMemberList);
			model.addAttribute("gymMemberList",gymMemberList);
			model.addAttribute("page",page);
			model.addAttribute("g_id",gym.getG_id());
			model.addAttribute("genderRatio",genderRatio);
			model.addAttribute("ageRatio",ageRatio);
			return "jh/gymMemberList";
		} else {
			return "jm/jmLoginForm";
		}
	}

	
	//헬스장 지점찾기 페이지********************************************************************************************************************
	@GetMapping(value = "/GymPostList")
	public String gymPostList(GymBoardFileServiceReviewJoin GymBoardServiceJoin , Model model) {
		//페이징 작업
		int gymImformationCount = jh.getGymImformationCount();
		Paging page = new Paging(gymImformationCount,GymBoardServiceJoin.getCurrentPage());
		GymBoardServiceJoin.setStart(page.getStart());
		GymBoardServiceJoin.setEnd(page.getEnd());
		List<GymBoardFileServiceReviewJoin> gymSearchPage = jh.getGymSearchPage(GymBoardServiceJoin);
		model.addAttribute("page",page);
		model.addAttribute("gymImformationCount",gymImformationCount);
		model.addAttribute("gymSearchPage",gymSearchPage);

		return "jh/gymPostList";
	}
	
	//지점찾기 글 상세******************************************************************************************************************
	@GetMapping(value = "/gymPostDetail")
	public String gymPostDetail(HttpSession session,GymBoard gymBoard,Model model) {
		System.out.println(gymBoard.getG_id());
		Member member = new Member();
		MemberGym memberGymManager = new MemberGym();
		member = jm.jmGetMemberFromId((String) session.getAttribute("m_id"));
		if (session.getAttribute("m_id") != null) {
			System.out.println("*****"+gymBoard.getG_id());
			memberGymManager.setM_number(member.getM_number());
			memberGymManager.setG_id(gymBoard.getG_id());
			System.out.println("*****"+memberGymManager);
			MemberGSGymOrderReviewJoin gymManagerSelect = jh.gymManagerSelect(memberGymManager);
			model.addAttribute("gymManagerSelect",gymManagerSelect);
			System.out.println("**********************************"+gymManagerSelect);
		}
		
		List <GymBoardJoin> gymBoardDetail = jh.gymBoardDetailRead(gymBoard.getG_id());
		// 별점, 별점개수 가져오기
		GymBoardReviewJoin avgReviewSelect = jh.getAvgReviewSelect(gymBoard.getG_id());
		//서비스 리스트 가져오기
		List<GSGSDetailJoin> selectServiceList = jh.getSelectServiceList(gymBoard.getG_id());	
		// 트레이너 리스트 가져오기
		List <Trainer> selectTrainerList = jh.getSelectTrainerList(gymBoard.getG_id());
		// 리뷰 가져오기
		List <MemberGSGymOrderReviewJoin> selectReviewList = jh.getselectReviewList(gymBoard.getG_id());
		//사진 가져오기
		List <GymBoardFile> gymBoardFileList = jh.gymBoardFileListRead(gymBoard.getG_id());

		model.addAttribute("member",member);
		model.addAttribute("g_id", gymBoard.getG_id());
		model.addAttribute("gymBoardDetail", gymBoardDetail);
		model.addAttribute("avgReviewSelect", avgReviewSelect);
		model.addAttribute("selectServiceList",selectServiceList);
		model.addAttribute("selectTrainerList",selectTrainerList);
		model.addAttribute("selectReviewList", selectReviewList);
		model.addAttribute("gymBoardFileList", gymBoardFileList);
		return "jh/gymPostListDetail";
	}
	
	// 리뷰 작성 버튼 누를 시 회원 여부 확인
	@GetMapping(value = "/getUserInfo/{gId}")
	@ResponseBody
	public Object getUserInfoVaild (@PathVariable("gId") int g_id, HttpSession session , Model model) {
		if (session.getAttribute("m_id") != null) { // 세션에 등록되어있을때=로그인했을때
			Member member = new Member();
			member = jm.jmGetMemberFromId((String) session.getAttribute("m_id"));
			int memberNumber = member.getM_number(); 
			System.out.println("******"+g_id);
			System.out.println("*******"+memberNumber);		
			MemberGSGymOrderReviewJoin reviewListSearch = new MemberGSGymOrderReviewJoin();
			reviewListSearch.setG_id(g_id);
			reviewListSearch.setM_number(memberNumber);
			System.out.println("******"+reviewListSearch);
			List<MemberGSGymOrderReviewJoin> reviewSearch = jh.getReviewSearch(reviewListSearch);
			if(reviewSearch.size()>0) {
		        Map<String, Object> response = new HashMap<>();
		        response.put("m_name", member.getM_name());
		        response.put("services", reviewSearch);
		        response.put("sd_number", session.getAttribute("sd_number"));
		        response.put("go_number", session.getAttribute("go_number"));
	
		        return ResponseEntity.ok(response);
	        }else {
				return "error";
	        }
			
		} else { // 로그인 되지 않았을 때
			return "forward:jmLoginForm";
		}
		
	}
	
	@PostMapping("/submitReview")
	@ResponseBody
    public String submitReview(HttpSession session, HttpServletRequest request) {
		if (session.getAttribute("m_id") != null) { // 세션에 등록되어있을때=로그인했을때
			Member member = new Member();
			member = jm.jmGetMemberFromId((String) session.getAttribute("m_id"));
			int memberNumber = member.getM_number();
			GymReview writeReview = new GymReview();
			writeReview.setG_id(Integer.parseInt(request.getParameter("g_id")));
			writeReview.setM_number(memberNumber);
			writeReview.setReview_content(request.getParameter("review_content"));
			writeReview.setReview_star(Integer.parseInt(request.getParameter("review_star")));
			writeReview.setReview_title(request.getParameter("review_title"));
			writeReview.setS_number(Integer.parseInt(request.getParameter("s_number")));
			writeReview.setSd_number(Integer.parseInt(request.getParameter("sd_number")));
			writeReview.setGo_number(Integer.parseInt(request.getParameter("go_number")));
			int saveReview = jh.getSaveReview(writeReview);
	
			if(saveReview == 1) {
				return "Save Review successfully!";
			}else {
				return "Faild...";
			}
		} else { // 로그인 되지 않았을 때
			return "forward:jmLoginForm";
		}  
    }
	
	
	@PostMapping("/submitReply/{goNumber}")
	@ResponseBody
    public String submitReplyReview(@PathVariable("goNumber") int goNumber, HttpSession session, HttpServletRequest request) {
		if (session.getAttribute("m_id") != null) { // 세션에 등록되어있을때=로그인했을때
			Member member = new Member();
			member = jm.jmGetMemberFromId((String) session.getAttribute("m_id"));
			int memberNumber = member.getM_number();
			GymReview replyReview = new GymReview();
			replyReview.setGo_number(goNumber);
			replyReview.setReview_comment(request.getParameter("replyContent"));
			int reviewReplyResult = jh.updateReview(replyReview);
			if(reviewReplyResult > 0) {
				return "success reply!";
			}else {
				return "Faild...";
			}	
		}else {
			return "jm/jmLoginForm";
		}
	}
	
	
	
	
	
	
	
	
	// 결제 폼 뷰 이동
	@GetMapping(value="movePaymentForm")
	public String movePaymentFormView (GSGSDetailJoin gsd, Model model) {
		System.out.println("movePaymentFormView g_id->"+gsd.getG_id());
		System.out.println("movePaymentFormView sd_number->"+gsd.getSd_number());
		System.out.println("movePaymentFormView s_number->"+gsd.getS_number());
		
		return "";
	}
	
	
	
	
	
	
}
