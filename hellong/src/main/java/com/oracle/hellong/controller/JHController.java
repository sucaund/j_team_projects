package com.oracle.hellong.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.hellong.model.GS;
import com.oracle.hellong.model.Gym;
import com.oracle.hellong.model.GymBoard;
import com.oracle.hellong.model.GymBoardFile;
import com.oracle.hellong.model.GymBoardJoin;
import com.oracle.hellong.model.GymMemberServiceOrderJoin;
import com.oracle.hellong.model.MemberGym;
import com.oracle.hellong.model.Trainer;
import com.oracle.hellong.service.jh.JHService;
import com.oracle.hellong.service.jh.Paging;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class JHController { ////
	private final JHService jh;
		
	
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
	public String gymManager(Gym m_id, Model model) {
		System.out.println("JHController gymManager start");
		List<Gym>ManageList = jh.manageList(m_id.getM_number());
		model.addAttribute("ManageList",ManageList);
		return "jh/gymManager";
	}
	
	// 관리헬스장 홍보글 등록/수정 화면 이동********************************************************************************************************
	@GetMapping(value = "createGymForm")
	public String createGymPost(Gym g_id, Model model) {
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
	public String trainerList(Gym gym, Trainer trainer,Model model) {
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
		
	
	// 서비스(상품) 리스트 ****************************************************************************
	@GetMapping(value = "serviceList")
	public String serviceList(Gym gym, GS gs, Model model) {
		//page 작업
		int totalService = jh.totalService(gym.getG_id());
		Paging page = new Paging(totalService,gs.getCurrentPage());
		gs.setStart(page.getStart());
		gs.setEnd(page.getEnd());
		// 리스트 조회
		List<GS>serviceList = jh.serviceList(gs);
		// g_id 넘겨줄 것
		int gymId = jh.gymId(gym.getG_id());
		model.addAttribute("g_id",gymId);
		model.addAttribute("page",page);
		model.addAttribute("serviceList",serviceList);
	
		return "jh/serviceList";
	}
	
	//서비스 추가
	@PostMapping(value = "jh/createService")
	@ResponseBody
	public String createService(HttpServletRequest request) {
		GS gs = new GS();
		gs.setG_id(Integer.parseInt(request.getParameter("g_id")));
		gs.setS_name(request.getParameter("s_name"));
		gs.setS_detail(request.getParameter("s_detail"));
		gs.setS_price(Integer.parseInt(request.getParameter("s_price")));
		gs.setS_period(Integer.parseInt(request.getParameter("s_period")));
		gs.setS_matters(request.getParameter("s_matters"));
		int createService = jh.createService(gs);
        if (createService == 1) {
            return "Service createService successfully!";
        } else {
            return "Failed to createService!";
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
    	int updateService = jh.updateService(gs);
        if (updateService == 1) {
            return "Service updateService successfully!";
        } else {
            return "Failed to updateService!";
        }
	}
	
	//서비스 삭제
	@DeleteMapping(value="jh/deleteService/{sNumber}")
	@ResponseBody
	public String deleteService(@PathVariable("sNumber") int sNumber) {
		System.out.println(sNumber);
		int deleteService = jh.deleteService(sNumber);
        if (deleteService == 1) {
            return "Service deleteService successfully!";
        } else {
            return "Failed to deleteService!";
        }	
	}
	
	
	// 헬스장 회원리스트***********************************************************************************
	@GetMapping(value = "gymMemberListDetail")
	public String gymMemberListDetail(GymMemberServiceOrderJoin gymMember,Gym gym, Model model) {	
		//회원리스트 조회
		List<GymMemberServiceOrderJoin> gymMemberList = jh.getGymMemberList(gym.getG_id());
		//누적 매출액
		int sumSale = jh.getSumSale(gym.getG_id());
		//누적 회원수
		int totalGymMemberList = jh.getTotalGymMemberList(gym.getG_id());
		//page
		Paging page = new Paging(totalGymMemberList,gymMember.getCurrentPage());
		gymMember.setStart(page.getStart());
		gymMember.setEnd(page.getEnd());
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
	}

	
	//헬스장 지점찾기 페이지********************************************************************************************************************
	@GetMapping(value = "/GymPostList")
	public String gymPostList(GymBoard gymboard,GymBoardFile gymBoardFile ,Model model) {
		List <GymBoardJoin> gymImformation = jh.gymGymBoardList();
		List <GymBoardFile> gymBoardFileList = jh.gymBoardFileList(); 
		
		//페이징 작업
		
		//리뷰 수, 리뷰 평점 조회
		// 서비스 중 최저가 조회
		
		System.out.println(gymBoardFileList); 
		model.addAttribute("gymImformation",gymImformation);
		model.addAttribute("gymBoardFileList",gymBoardFileList); 
		return "jh/gymPostList";
	}
	
	@GetMapping(value = "/gymPostDetail")
	public String gymPostDetail(GymBoard gymBoard,Model model) {
		System.out.println(gymBoard.getG_id());
		List <GymBoardJoin> gymBoardDetail = jh.gymBoardDetailRead(gymBoard.getG_id());
		List <GymBoardFile> gymBoardFileList = jh.gymBoardFileListRead(gymBoard.getG_id());
		System.out.println(gymBoardFileList);
		model.addAttribute("gymBoardDetail", gymBoardDetail);
		model.addAttribute("gymBoardFileList", gymBoardFileList);
		return "jh/gymPostListDetail";
	}
	
	
	
	
	
	
	
}